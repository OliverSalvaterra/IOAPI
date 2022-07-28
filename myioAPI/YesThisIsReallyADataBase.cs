using System;
using System.Collections.Generic;
using System.Data;

namespace myioAPI
{
    public sealed partial class YesThisIsReallyADataBase
    {
        public interface ITable { bool IsEmpty { get; } }
        

        public class Table<TKey> : ITable
        {
            private HashSet<TKey> data;

            public bool this[TKey key]
            {
                get => data.Contains(key);
                set => data.Add(key);
            }

            public bool IsEmpty => data.Count == 0;
        }

        public class Table<TKey, TValue> : ITable
        {
            private Dictionary<TKey, TValue> data;

            public TValue this[TKey index]
            {
                get => data[index];
                set => data[index] = value;
            }

            public bool IsEmpty => data.Count == 0;
        }
    }

    public sealed partial class YesThisIsReallyADataBase
    {
        private readonly Dictionary<string, ITable> kvpTables;
        private readonly Dictionary<string, DataTable> sqlTables;
        public static YesThisIsReallyADataBase DataBase { get; } = new YesThisIsReallyADataBase();

        private YesThisIsReallyADataBase() { }
        static YesThisIsReallyADataBase() { }

        public Table<TKey, TValue> GetTable<TKey, TValue>(string tableName) => kvpTables[tableName] as Table<TKey, TValue>;
        public Table<TKey> GetTable<TKey>(string tableName) => kvpTables[tableName] as Table<TKey>;

        public bool AddKvpTable<TKey, TValue>(string tableName)
        {
            if (kvpTables.ContainsKey(tableName)) return false;

            kvpTables[tableName] = new Table<TKey, TValue>();
            return true;
        }

        public bool AddKvpTable<TKey>(string tableName)
        {
            if (kvpTables.ContainsKey(tableName)) return false;

            kvpTables[tableName] = new Table<TKey>();
            return true;
        }

        public bool AddSqlTables(string tableName, params (string name, Type type)[] columnInfos)
        {
            if (sqlTables.ContainsKey(tableName)) return false;

            DataTable table = new DataTable(tableName);
            foreach (var (name, type) in columnInfos)
            {
                table.Columns.Add(name, type);
            }

            sqlTables[tableName] = table;
            return true;
        }

        public ITable this[string tableName] => kvpTables[tableName];

        public object this[string tableName, int row, string columnName] => sqlTables[tableName].Rows[row][columnName];
        public object this[string tableName, string columnName] => sqlTables[tableName].Columns[columnName];
    }
}
