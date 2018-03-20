using MySql.Data.MySqlClient;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StemResultaten
{
    class DatabaseConnection
    {
        private MySqlConnection connection = new MySqlConnection("Server=localhost;Database=stemmen;Uid=root;Pwd=;");

        public DataTable krijgGemeenten()
        {
            connection.Open();

            MySqlCommand sqlCommand = connection.CreateCommand();
            sqlCommand.CommandText = "SELECT id, naam FROM gemeenten";

            MySqlDataReader dataReader = sqlCommand.ExecuteReader();

            DataTable dataTable = new DataTable();
            dataTable.Load(dataReader);

            connection.Close();

            return dataTable;
        }

        public DataTable krijgStemmenPerGemeente(string sGemeenteId)
        {
            connection.Open();

            MySqlCommand sqlCommand = connection.CreateCommand();
            sqlCommand.CommandText = "SELECT COUNT(stemmen.uID) as stemmen, partijen.naam as partijNaam, partijen.afkorting as partijAfkorting FROM stemmen INNER JOIN partijen ON stemmen.partij = partijen.id INNER JOIN gebruikers ON stemmen.uID = gebruikers.id INNER JOIN gemeenten ON gebruikers.gemeente = gemeenten.id WHERE gemeenten.id = @gemeenteId AND partijen.gemeente = @gemeenteId GROUP BY stemmen.partij";
            sqlCommand.Parameters.AddWithValue("@gemeenteId", sGemeenteId);

            MySqlDataReader dataReader = sqlCommand.ExecuteReader();

            DataTable dataTable = new DataTable();
            dataTable.Load(dataReader);

            connection.Close();

            return dataTable;
        }

        public DataTable krijgStatistiekenPerGemeente(string sGemeenteId)
        {
            connection.Open();

            MySqlCommand sqlCommand = connection.CreateCommand();
            sqlCommand.CommandText = "SELECT (SELECT COUNT(id) FROM gebruikers WHERE gemeente = @gemeenteId) as stemgerechtigde, (SELECT COUNT(uID) FROM stemmen INNER JOIN gebruikers ON stemmen.uID = gebruikers.id WHERE gebruikers.gemeente = @gemeenteId) as gestemd, (SELECT COUNT(partijen.id) FROM partijen WHERE gemeente = @gemeenteId) as aantalPartijen, (SELECT partijen.naam FROM stemmen INNER JOIN partijen ON stemmen.partij = partijen.id WHERE partijen.gemeente = @gemeenteId LIMIT 1) as bestePartij, (SELECT COUNT(stemmen.uID) FROM stemmen INNER JOIN partijen ON stemmen.partij = partijen.id WHERE partijen.gemeente = @gemeenteId LIMIT 1) as aantalStemmen";
            sqlCommand.Parameters.AddWithValue("@gemeenteId", sGemeenteId);

            MySqlDataReader dataReader = sqlCommand.ExecuteReader();

            DataTable dataTable = new DataTable();
            dataTable.Load(dataReader);

            connection.Close();

            return dataTable;
        }

        public DataTable krijgPartijenPerGemeente(string sGemeenteId)
        {
            connection.Open();

            MySqlCommand sqlCommand = connection.CreateCommand();
            sqlCommand.CommandText = "SELECT id, naam FROM partijen WHERE gemeente = @gemeenteId ORDER BY naam";
            sqlCommand.Parameters.AddWithValue("@gemeenteId", sGemeenteId);

            MySqlDataReader dataReader = sqlCommand.ExecuteReader();

            DataTable dataTable = new DataTable();
            dataTable.Load(dataReader);

            connection.Close();

            return dataTable;
        }

        public DataTable krijgPartijInformatie(string sPartijId)
        {
            connection.Open();

            MySqlCommand sqlCommand = connection.CreateCommand();
            sqlCommand.CommandText = "SELECT id, naam, afkorting FROM partijen WHERE id = @partijId";
            sqlCommand.Parameters.AddWithValue("@partijId", sPartijId);

            MySqlDataReader dataReader = sqlCommand.ExecuteReader();

            DataTable dataTable = new DataTable();
            dataTable.Load(dataReader);

            connection.Close();

            return dataTable;
        }

        public bool maakPartij(string sNaam, string sAfkoring, string sLogoId, string sGemeente)
        {
            try
            {
                connection.Open();

                MySqlCommand sqlCommand = connection.CreateCommand();
                sqlCommand.CommandText = "INSER INTO partijen (naam, afkorting, logo, gemeente) VALUES (@partijNaam, @partijAfkorting, @partijLogo, @partijGemeenten)";
                sqlCommand.Parameters.AddWithValue("@partijNaam", sNaam);
                sqlCommand.Parameters.AddWithValue("@partijAfkorting", sAfkoring);
                sqlCommand.Parameters.AddWithValue("@partijGemeenten", sGemeente);
                sqlCommand.Parameters.AddWithValue("@partijLogo", sLogoId);

                MySqlDataReader dataReader = sqlCommand.ExecuteReader();

                connection.Close();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool updatePartij(string sId, string sNaam, string sAfkorting, string sLogoId)
        {
            try
            {
                connection.Open();

                MySqlCommand sqlCommand = connection.CreateCommand();
                sqlCommand.CommandText = "UPDATE partijen SET naam = @partijNaam, afkorting = @partijAfkorting, logo = @partijLogo WHERE id = @partijId)";
                sqlCommand.Parameters.AddWithValue("@partijId", sId);
                sqlCommand.Parameters.AddWithValue("@partijNaam", sNaam);
                sqlCommand.Parameters.AddWithValue("@partijAfkorting", sAfkorting);
                sqlCommand.Parameters.AddWithValue("@partijLogo", sLogoId);

                MySqlDataReader dataReader = sqlCommand.ExecuteReader();

                connection.Close();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
