using System;
using System.Collections.Generic;

namespace AutoMagically.Infrastructure
{
    public interface IDataReader<T>  where T : class
    {
        IEnumerable<T> List();
    }
}
