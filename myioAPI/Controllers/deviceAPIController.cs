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
        DataLayer dl = new DataLayer();

        [HttpPost]
        public int PostNewUser([FromBody] MyAuthInfo myThingy)
        {
            return dl.CreateUser();
        }

    }
}
