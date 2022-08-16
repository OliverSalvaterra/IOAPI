using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using mIODTOs;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static myioAPI.YesThisIsReallyADataBase;

namespace myioAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DeviceAPIController : ControllerBase
    {
        IDataLayer dataLayer;
        
        public DeviceAPIController(IDataLayer dataLayer)
	    {
            this.dataLayer = dataLayer;
	    }

        [HttpGet]
        [Route("GetDevices")]
        public ActionResult<Device[]> GetDevices()
        {
            var result = dataLayer.GetDevices(userID: 3, isActive: true);

            return result;
        }

        [HttpGet]
        [Route("GetDeviceTypes")]
        public ActionResult<DeviceType[]> GetDeviceTypes()
        {
            var result = dataLayer.GetDeviceTypes(IsActive: true);

            return result;
        }

        [HttpGet]
        [Route("GetUser")]
        public ActionResult<int> GetUser()
        {
            var result = dataLayer.GetUser(username: "norman", password: "chonk");

            return result;
        }
    }
}
