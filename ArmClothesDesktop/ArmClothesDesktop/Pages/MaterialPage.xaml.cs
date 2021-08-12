using ArmClothesDesktop.Entities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ArmClothesDesktop.Pages
{
    /// <summary>
    /// Логика взаимодействия для MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : Page
    {
        Material current;
        public MaterialPage(Material material)
        {
            InitializeComponent();
            DataContext = material;
            current = material;
            SupliersLB.ItemsSource = material.MaterialSupplier.Select(i => i.Supplier);
            SupliersGiver.ItemsSource = Utils.DB.Supplier.ToList();
        }

        private void OnGoBack(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        void AddSupplier(object sender, RoutedEventArgs e)
        {
            if (SupliersGiver.SelectedIndex == -1 || current.MaterialSupplier.Any(i => i.Supplier == SupliersGiver.SelectedItem as Supplier))
                return;
            current.MaterialSupplier.Add(new MaterialSupplier() { Supplier = SupliersGiver.SelectedItem as Supplier, Material = current });
            SupliersLB.ItemsSource = null;
            SupliersLB.ItemsSource = current.MaterialSupplier.Select(i => i.Supplier);
        }

        void RemoveSupplier(object sender, RoutedEventArgs e)
        {
            if (SupliersLB.SelectedIndex == -1)
                return;
            current.MaterialSupplier.Remove(current.MaterialSupplier.FirstOrDefault(i => i.Supplier == SupliersLB.SelectedItem as Supplier));
            SupliersLB.ItemsSource = null;
            SupliersLB.ItemsSource = current.MaterialSupplier.Select(i => i.Supplier);
        }

        void OnSaveMaterial(object sender, RoutedEventArgs e)
        {
            if (current.Id == 0)
            {
                Utils.DB.Material.Add(current);
            }
            try
            {
                Utils.DB.SaveChanges();
                NavigationService.GoBack();

            }
            catch (Exception)
            {
                MessageBox.Show("Упс");
                throw;
            }
        }

        private void ChooseImage(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            if (dialog.ShowDialog().GetValueOrDefault())
            {
                Utils.DB.Image.Add(new Entities.Image() {Data = File.ReadAllBytes(dialog.FileName) });
                current.Image = Utils.DB.Image.ToList().Last();
            }
        }

        void OnRemoveMaterial(object sender, RoutedEventArgs e)
        {
            Utils.DB.Material.Remove(current);
            Utils.DB.SaveChanges();
            NavigationService.GoBack();
        }
    }
}
