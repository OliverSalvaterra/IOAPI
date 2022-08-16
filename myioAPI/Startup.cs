using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static myioAPI.YesThisIsReallyADataBase;

namespace myioAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            connectionString = new SqlConnectionStringBuilder()
            {
                DataSource = "GMRMLTV",
                UserID = "sa",
                Password = "GreatMinds110",
                InitialCatalog = "OliverIODB"
            }.ToString();

        }

        public IConfiguration Configuration { get; }
        private static string connectionString;

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers().AddNewtonsoftJson();
            services.AddSwaggerGen();

            services.AddScoped<IDbConnection, SqlConnection>((sp) => new SqlConnection(connectionString));
            services.AddScoped<IDataLayer, DataLayer>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
                options.RoutePrefix = string.Empty;
            });

            //app.UseHttpsRedirection();

            app.UseRouting();

            //app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });


            //ConfigureDB();
        }

        private void ConfigureDB()
        {
            DataBase.AddKvpTable<int, DataPoint<int>>("Device1Data");
            DataBase.AddKvpTable<int, DataPoint<string>>("Device2Data");
            DataBase.AddKvpTable<string>("Keys");
            

            DataBase.AddSqlTables("DataPoints", ("DataPointID", typeof(int)), ("DeviceID", typeof(Guid)), ("DateTime", typeof(DateTime)), ("Value", typeof(int)));
        }
    }
}
