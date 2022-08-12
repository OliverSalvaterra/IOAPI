using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Text;
using mIODTOs;
using System.Data.SqlClient;

namespace myioAPI
{
    public class DataLayer : IDataLayer, IDisposable
    {
        private bool disposedValue;

        public DataLayer()
        {
            SqlConnection sqlConnection = new SqlConnection();
        }

        public string hash(string s)
        {
            using var hash = SHA256.Create();
            var byteArray = hash.ComputeHash(Encoding.UTF8.GetBytes(s));
            return System.Text.Encoding.UTF8.GetString(byteArray, 0, byteArray.Length);
        }

        public int CreateUser(string username, string password)
        {
            string databasePass = hash(password);

            return 1;
        }

        private int CreateConnection(int UserID, int DeviceID)
        {
            return 1;
        }

        public UserData[]? GetData(int UserID, int DeviceID, int MinValue, int MaxValue, DateTime MinDate, DateTime MaxDate)
        {
            return null;
        }

        public Device[]? GetDevices(int UserID, bool IsActive)
        {
            return null;
        }

        public DeviceType[] GetDeviceTypes(bool IsActive)
        {
            return null;
        }

        public User? GetUser(string username, string password)
        {
            string databasPass = hash(password);

            return null;
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
