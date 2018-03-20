using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StemResultaten
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private DatabaseConnection dbConnection = new DatabaseConnection();

        private string sCurrentPartijId = "0";

        public MainWindow()
        {
            InitializeComponent();

            updateComboBoxGemeenten();
        }

        private void updateComboBoxGemeenten()
        {
            DataTable dataTable = dbConnection.krijgGemeenten();

            DataRow dataRow = dataTable.NewRow();
            dataRow[0] = 0;
            dataRow[1] = "Selecteer een Gemeente";

            dataTable.Rows.InsertAt(dataRow, 0);

            cbResultatenGemeenten.ItemsSource = dataTable.DefaultView;
            cbStatistiekenGemeenten.ItemsSource = dataTable.DefaultView;
            cbPartijenGemeenten.ItemsSource = dataTable.DefaultView;

            cbResultatenGemeenten.SelectedIndex = 0;
            cbStatistiekenGemeenten.SelectedIndex = 0;
            cbPartijenGemeenten.SelectedIndex = 0;
        }

        private void updateStemResultaten(string sGemeenteId)
        {
            dgStemResultaten.ItemsSource = dbConnection.krijgStemmenPerGemeente(sGemeenteId).DefaultView;
        }

        private void updatePartijen(string sGemeenteId)
        {
            DataTable dataTable = dbConnection.krijgPartijenPerGemeente(sGemeenteId);

            DataRow dataRow = dataTable.NewRow();
            dataRow[0] = 0;
            dataRow[1] = "Selecteer een Partij";

            dataTable.Rows.InsertAt(dataRow, 0);

            DataRow dataRow2 = dataTable.NewRow();
            dataRow2[0] = 1000;
            dataRow2[1] = "Nieuwe partij...";

            dataTable.Rows.InsertAt(dataRow2, 1000);

            cbPartijenLijst.ItemsSource = dataTable.DefaultView;
            cbPartijenLijst.SelectedIndex = 0;
        }

        private void updateStatistieken(string sGemeenteId)
        {
            DataTable dataTable = dbConnection.krijgStatistiekenPerGemeente(sGemeenteId);

            tbStatistiekenStemgerechtigde.Text = dataTable.Rows[0]["stemgerechtigde"].ToString();
            tbStatistiekenGestemde.Text = dataTable.Rows[0]["gestemd"].ToString();
            tbStatistiekenPartijen.Text = dataTable.Rows[0]["aantalPartijen"].ToString();
            tbStatistiekenBestePartij.Text = dataTable.Rows[0]["bestePartij"].ToString();
            tbStatistiekenParijStemmen.Text = dataTable.Rows[0]["aantalStemmen"].ToString();

            try
            {
                int iStemgerechtigde = int.Parse(dataTable.Rows[0]["stemgerechtigde"].ToString());
                int iGestemde = int.Parse(dataTable.Rows[0]["gestemd"].ToString());

                double dOpkomst = (double)iGestemde / (double)iStemgerechtigde * 100;

                tbStatistiekenOpkomst.Text = dOpkomst + "%";
            }
            catch (Exception)
            {
                tbStatistiekenOpkomst.Text = "0%";
            }
        }

        private void updatePartijenInfo(string sPartijId)
        {
            DataTable dataTable = dbConnection.krijgPartijInformatie(sPartijId);

            sCurrentPartijId = dataTable.Rows[0]["id"].ToString();

            tbPartijNaam.Text = dataTable.Rows[0]["naam"].ToString();
            tbPartijAfkorting.Text = dataTable.Rows[0]["afkorting"].ToString();
        }

        private void cbResultatenGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedValue.ToString() != "0")
            {
                updateStemResultaten(comboBox.SelectedValue.ToString());
            }
        }

        private void cbStatistiekenGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedValue.ToString() != "0")
            {
                updateStatistieken(comboBox.SelectedValue.ToString());
            }
        }

        private void cbPartijenGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedValue.ToString() != "0")
            {
                updatePartijen(comboBox.SelectedValue.ToString());
                cbPartijenLijst.Visibility = Visibility.Visible;
            }
            else
            {
                cbPartijenLijst.Visibility = Visibility.Hidden;
                gPartijenInformatie.Visibility = Visibility.Hidden;
            }
        }

        private void cbPartijenLijst_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedValue.ToString() == "0")
            {
                gPartijenInformatie.Visibility = Visibility.Hidden;
                sCurrentPartijId = "0";
            }
            else
            {
                gPartijenInformatie.Visibility = Visibility.Visible;
                if (comboBox.SelectedValue.ToString() != "1000")
                {
                    updatePartijenInfo(comboBox.SelectedValue.ToString());
                }
                else
                {
                    sCurrentPartijId = "0";
                    tbPartijNaam.Text = "";
                    tbPartijAfkorting.Text = "";
                }
            }
        }

        private void btnUpdatePartij_Click(object sender, RoutedEventArgs e)
        {
            if (cbPartijenLijst.SelectedValue.ToString() == "0" || sCurrentPartijId == "0")
            {
                //Do Nothing
            }
            else if (cbPartijenLijst.SelectedValue.ToString() == "1000")
            {
                if (dbConnection.maakPartij(tbPartijNaam.Text, tbPartijAfkorting.Text, cbPartijenLogos.SelectedValue.ToString(), cbPartijenGemeenten.SelectedValue.ToString()))
                {
                    MessageBox.Show("Partij aangemaakt");
                }
                else
                {
                    MessageBox.Show("De partij kon niet worden aangemaakt");
                }
            }
            else
            {
                if (dbConnection.updatePartij(sCurrentPartijId, tbPartijNaam.Text, tbPartijAfkorting.Text, cbPartijenLogos.SelectedValue.ToString()))
                {
                    MessageBox.Show("Partij informatie bijgewerkt");
                }
                else
                {
                    MessageBox.Show("De partij informatie kon niet worden bijgewerkt")
                }
            }
        }
    }
}
