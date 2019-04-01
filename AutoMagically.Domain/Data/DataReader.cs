using System.Collections.Generic;
using AutoMagically.Domain.Models;
using AutoMagically.Infrastructure;

namespace AutoMagically.Domain.Data
{
    public class MagicReader : IDataReader<Magic>
    {
        public IEnumerable<Magic> List() => new List<Magic>
            {new Magic {Name = "Auto Update Strings"}, new Magic {Name = "Fancy stuff"}};
    }
}
