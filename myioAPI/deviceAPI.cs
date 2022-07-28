using System;
using System.Collections.Generic;

namespace myioAPI
{
    public class deviceAPI<T>
    {
        public string ID { get; set; }

        public List<DataPoint<T>> Data { get; set; }
    }

    public class DataPoint<T>
    {
        public T value { get; set; }
        public DateTime date { get; set; }
    }
}
