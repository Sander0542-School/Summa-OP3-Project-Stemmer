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

        public MainWindow()
        {
            InitializeComponent();

            updateComboBoxGemeenten();
        }

        private void updateComboBoxGemeenten()
        {
            cbResultatenGemeenten.Items.Clear();
            cbStatistiekenGemeenten.Items.Clear();
            cbPartijenGemeenten.Items.Clear();

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

        private void updateStemResultaten(int iGemeenteId)
        {
            dgStemResultaten.ItemsSource = dbConnection.krijgStemmenPerGemeente(iGemeenteId).DefaultView;
        }

        private void updatePartijen(int iGemeenteId)
        {
            dgPartijen.ItemsSource = dbConnection.krijgPartijenPerGemeente(iGemeenteId).DefaultView;
        }

        private void updateStatistieken(int iGemeenteId)
        {
            DataTable dataTable = dbConnection.krijgStatistiekenPerGemeente(iGemeenteId);

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

        private void cbResultatenGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedIndex != 0)
            {
                updateStemResultaten(comboBox.SelectedIndex);
            }
        }

        private void cbStatistiekenGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedIndex != 0)
            {
                updateStatistieken(comboBox.SelectedIndex);
            }
        }

        private void cbPartijenGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedIndex != 0)
            {
                updatePartijen(comboBox.SelectedIndex);
            }
        }
    }
}
