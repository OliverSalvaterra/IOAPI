using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static myioAPI.YesThisIsReallyADataBase;

namespace myioAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class deviceAPIController<T> : ControllerBase
    {        
        private bool idCheck(string id)
        {
            return true;
        }

        private bool idRegistration(string id, Type dataType, string key)
        {
            var keys = DataBase.GetTable<string>("Keys");

            if (!keys[key]) return false;

            DataBase.AddKvpTable<DateTime, int>(id);
            return true;
        }

        [HttpGet]
        public List<DataPoint<T>> GetAllData(string id)
        {
            return new List<DataPoint<T>>(); //return all data from database for id, IF DATA DOES NOT EXIST RETURN EMPTY LIST
        }

        [HttpGet]
        public DataPoint<T> GetMostRecentData(string id)
        {
            return new DataPoint<T>(); //return most recent data from database for id, IF ID DOES NOT EXIST RETURN -1
        }

        [HttpPost]
        public int post(string id, T data) //returns -1 for missing key, returns 0 for incorrect key, returns 7 for successful post
        {
            if (!idCheck(id)) return -1;
            //add data to database list for specific id
            return 7;
        }

        [HttpPost]
        public int post(string id, string key, T data)
        {
            if (!idCheck(id))
            {
                if (!idRegistration(id, key)) return 0;
            }
            //add data to database list for specific id
            return 7;
        }
    }
}
