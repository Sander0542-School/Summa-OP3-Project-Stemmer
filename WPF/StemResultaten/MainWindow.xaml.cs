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
            cbGemeenten.Items.Clear();

            DataTable dataTable = dbConnection.krijgGemeenten();

            DataRow dataRow = dataTable.NewRow();
            dataRow[0] = 0;
            dataRow[1] = "Selecteer een Gemeente";

            dataTable.Rows.InsertAt(dataRow, 0);

            cbGemeenten.ItemsSource = dataTable.DefaultView;

            cbGemeenten.SelectedIndex = 0;
        }

        private void updateChart(int iGemeenteId)
        {
            dgStemResultaten.ItemsSource = dbConnection.krijgStemmenPerGemeente(iGemeenteId).DefaultView;
        }

        private void cbGemeenten_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;

            if (comboBox.SelectedIndex != 0)
            {
                updateChart(comboBox.SelectedIndex);
            }
        }
    }
}
