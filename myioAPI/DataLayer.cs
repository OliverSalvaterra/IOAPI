using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Text;
using mIODTOs;
using System.Data.SqlClient;
using System.Data;

namespace myioAPI
{
    public class DataLayer : IDataLayer, IDisposable
    {
        private bool disposedValue;
        IDbConnection dbConnection;

        public DataLayer(IDbConnection dbConnection)
        {
            this.dbConnection = dbConnection;
        }

        public string Hash(string s)
        {
            using var hash = SHA256.Create();
            var byteArray = hash.ComputeHash(Encoding.UTF8.GetBytes(s));
            return System.Text.Encoding.UTF8.GetString(byteArray, 0, byteArray.Length);
        }

        public int CreateUser(string username, string password)
        {
            string databasePass = Hash(password);

            return 1;
        }

        private int CreateConnection(int UserID, int DeviceID)
        {
            return 1;
        }

        public UserData[] GetData(int UserID, int DeviceID, int MinValue, int MaxValue, DateTime MinDate, DateTime MaxDate)
        {
            return null;
        }

        public Device[] GetDevices(int userID, bool isActive)
        {
            SqlCommand command = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "usp_GetDevices",
                Connection = dbConnection as SqlConnection
            };

            command.Parameters.Add(new SqlParameter("UserID", userID));
            command.Parameters.Add(new SqlParameter("IsActive", isActive));

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            var result = new Device[dataTable.Rows.Count];
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                DataRow row = dataTable.Rows[i];
                result[i] = new Device()
                {
                    DeviceID = (int)row["DeviceID"],
                    DeviceName = row["DeviceName"].ToString(),
                    AccessKey = Guid.Parse(row["AccessKey"].ToString()),
                    DeviceTypeID = (byte)row["DeviceTypeID"],
                    IsActive = (bool)row["IsActive"]
                };
            }

            return result;
        }

        public DeviceType[] GetDeviceTypes(bool isActive)
        {
            SqlCommand command = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "usp_GetDeviceTypes",
                Connection = dbConnection as SqlConnection
            };

            command.Parameters.Add(new SqlParameter("IsActive", isActive));

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            var result = new DeviceType[dataTable.Rows.Count];
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                DataRow row = dataTable.Rows[i];
                result[i] = new DeviceType()
                {
                    DeviceTypeID = (byte)row["DeviceTypeID"],
                    DeviceTypeName = row["DeviceTypeName"].ToString(),
                    Description = row["Description"].ToString(),
                    IsActive = (bool)row["IsActive"]
                };
            }

            return result;
        }

        public int GetUser(string username, string password)
        {
            string databasPass = Hash(password);

            SqlCommand command = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = "usp_GetUser",
                Connection = dbConnection as SqlConnection
            };

            command.Parameters.Add(new SqlParameter("Username", username));
            command.Parameters.Add(new SqlParameter("Password", databasPass));

            SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            return (int)dataTable.Rows[0]["UserID"];
        }

        public int PostDataPoint(int DeviceID, int Value)
        {
            return 1;
        }

        public int PostDevice(int UserID, int DeviceTypeID, string DeviceName)
        {
            return 1;
        }

        public int PostDeviceType(string DeviceTypeName, string Description, bool IsActive)
        {
            return 1;
        }

        public int SetConnectionActivity(int UserID, int DeviceID, bool Active)
        {
            return 1;
        }

        public int SetUserActivity(int UserID, bool Active)
        {
            return 1;
        }

        public int SetDeviceActivity(int DeviceID, bool IsActive)
        {
            return 1;
        }

        public int SetDeviceTypeActivity(byte DeviceTypeID, bool IsActive)
        {
            return 1;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects)
                }

                // TODO: free unmanaged resources (unmanaged objects) and override finalizer
                // TODO: set large fields to null
                disposedValue = true;
            }
        }

        // // TODO: override finalizer only if 'Dispose(bool disposing)' has code to free unmanaged resources
        // ~DataLayer()
        // {
        //     // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
        //     Dispose(disposing: false);
        // }

        public void Dispose()
        {
            // Do not change this code. Put cleanup code in 'Dispose(bool disposing)' method
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }
    }
}
