using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace ArmClothesDesktop.Entities
{
    partial class Material
    {
        public string Suppliers => $"Поставщики: {string.Join(", ", MaterialSupplier.Select(i => i.Supplier.Name))}";
        public string NameAndType => $"{this.MaterialType.Name} | {Name}";
        public SolidColorBrush CountColor
        {
            get
            {
                if (CurrentCount / MinimalCount >= 3)
                    return (SolidColorBrush)new BrushConverter().ConvertFromString("#ffba01");
                else if(CurrentCount < MinimalCount)
                    return (SolidColorBrush)new BrushConverter().ConvertFromString("#f19292");
                return null;
            }
        }
    }
}
