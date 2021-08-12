using System;
using System.Collections.Generic;
using System.Linq;
using ArmClothesDesktop.Entities;
using System.Text;
using System.Threading.Tasks;

namespace ArmClothesDesktop
{
    public static class Utils
    {
        public static ArmClothesEntities DB = new ArmClothesEntities();

        public static void Clone<T>(T source, T clone, params string[] ignore)
        {
            foreach(var sourceProp in source.GetType().GetProperties())
            {
                clone.GetType().GetProperty(sourceProp.Name).SetValue(clone, sourceProp.GetValue(source));
            }
        }
    }
}
