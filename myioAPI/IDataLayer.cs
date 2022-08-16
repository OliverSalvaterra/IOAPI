using System;
using mIODTOs;

namespace myioAPI
{
    public interface IDataLayer
    {
        int CreateUser(string username, string password);
        UserData[] GetData(int UserID, int DeviceID, int MinValue, int MaxValue, DateTime MinDate, DateTime MaxDate);
        Device[] GetDevices(int userID, bool isActive);
        DeviceType[] GetDeviceTypes(bool IsActive);
        int GetUser(string username, string password);
        string Hash(string s);
        int PostDataPoint(int DeviceID, int Value);
        int PostDevice(int UserID, int DeviceTypeID, string DeviceName);
        int PostDeviceType(string DeviceTypeName, string Description, bool IsActive);
        int SetConnectionActivity(int UserID, int DeviceID, bool Active);
        int SetDeviceActivity(int DeviceID, bool IsActive);
        int SetDeviceTypeActivity(byte DeviceTypeID, bool IsActive);
        int SetUserActivity(int UserID, bool Active);
    }
}