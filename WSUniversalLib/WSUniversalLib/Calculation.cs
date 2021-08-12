using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WSUniversalLib
{
    public class Calculation
    {
        public int GetQuantityForProduct(int productType, int materialType, int count, float width, float length)
        {
            var productQuantity = count * width * length;
            switch (productType)
            {
                case 1:
                    productQuantity *= 1.1f;
                    break;
                case 2:
                    productQuantity *= 2.5f;
                    break;
                case 3:
                    productQuantity *= 8.43f;
                    break;
                default:
                    return -1;
            }
            switch (materialType)
            {
                case 1:
                    productQuantity *= (100 / 99.7f);
                    break;
                case 2:
                    productQuantity *= (100 / 97.5f);
                    break;
                default:
                    return -1;
            }
            return Convert.ToInt32(Math.Round(productQuantity));
        }
    }
}
