using ArmClothesDesktop.Entities;
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
    /// Логика взаимодействия для MaterialsPage.xaml
    /// </summary>
    public partial class MaterialsPage : Page
    {
        List<Material> currentMaterials;
        int currentPage;
        public void OnSetPage(object sender, RoutedEventArgs e)
        {
            var current = sender as Button;
            if (int.TryParse(current.Content.ToString(), out int res))
            {
                MaterialsLW.ItemsSource = current.DataContext as List<Material>;
                currentPage = res - 1;
            }
        }



        public MaterialsPage()
        {
            InitializeComponent();

            currentMaterials = Utils.DB.Material.ToList();
            CountTB.Text = $"{currentMaterials.Count} из {Utils.DB.Material.ToList().Count}";
            foreach (var item in currentMaterials)
            {
                if (item.Image == null)
                {
                    item.Image = new Entities.Image() { Data = File.ReadAllBytes(@"Resouces\picture.png") };
                }
            }
            UpdateMaterials();
        }

        private void LastPage(object sender, RoutedEventArgs e)
        {
            if (currentPage != 0)
                currentPage--;
            MaterialsLW.ItemsSource = currentMaterials.Skip(currentPage * 15).Take(15).ToList();
        }

        private void NextPage(object sender, RoutedEventArgs e)
        {
            if (currentPage != PageByttonsSP.Children.Count - 1)
                currentPage++;
            MaterialsLW.ItemsSource = currentMaterials.Skip(currentPage * 15).Take(15).ToList();

        }

        private void AddMaterial(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new MaterialPage(new Material()));
        }

        private void OnSort(object sender, SelectionChangedEventArgs e)
        {
            if (MaterialsLW == null)
                return;
            if (SortCB.SelectedIndex == 0)
                return;
            switch (SortCB.SelectedIndex)
            {
                case 1:
                case 2:
                    currentMaterials = currentMaterials.OrderBy(i => i.Name).ToList();
                    break;
                case 3:
                case 4:
                    currentMaterials = currentMaterials.OrderBy(i => i.CurrentCount).ToList();
                    break;
                case 5:
                case 6:
                    currentMaterials = currentMaterials.OrderBy(i => i.Price).ToList();
                    break;
            }
            if (SortCB.SelectedIndex % 2 == 0)
                currentMaterials.Reverse();
            MaterialsLW.ItemsSource = null;
            MaterialsLW.ItemsSource = currentMaterials;
            UpdateMaterials();

        }

        private void OnFilter(object sender, SelectionChangedEventArgs e)
        {
            if (MaterialsLW == null)
                return;
            if (FilterCB.SelectedIndex == 0)
                currentMaterials = Utils.DB.Material.ToList();
            else
                currentMaterials = Utils.DB.Material.Where(i => i.TypeId == FilterCB.SelectedIndex).ToList();
            currentPage = 0;
            MaterialsLW.ItemsSource = null;
            MaterialsLW.ItemsSource = currentMaterials.Skip(currentPage * 15).Take(15).ToList();
            OnSort(null, null);
            if (sender != null)
                SearchTB_TextChanged(null, null);
            UpdateMaterials();
        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SearchTB.Text))
            {
                currentMaterials = Utils.DB.Material.ToList();
                OnFilter(null, null);
                OnSort(null, null);
            }
            else
                currentMaterials = currentMaterials.Where(i => i.Name.ToLower().Contains(SearchTB.Text.ToLower())).ToList();
            UpdateMaterials();
        }

        void UpdateMaterials()
        {
            CountTB.Text = $"{currentMaterials.Count} из {Utils.DB.Material.ToList().Count}";
            PageByttonsSP.Children.Clear();
            for (int i = 0; i < currentMaterials.Count / 15; i++)
            {
                Button tmpButton = new Button()
                {
                    Content = i + 1,
                    Width = 20,
                    DataContext = currentMaterials.Skip(i * 15).Take(15).ToList()
                };
                tmpButton.Click += OnSetPage;
                PageByttonsSP.Children.Add(tmpButton);
            }
            MaterialsLW.ItemsSource = null;
            MaterialsLW.ItemsSource = currentMaterials.Take(15).ToList();
        }

        private void EditMaterial(object sender, SelectionChangedEventArgs e)
        {
            if (MaterialsLW.SelectedItem == null)
                return;
            NavigationService.Navigate(new MaterialPage(MaterialsLW.SelectedItem as Material));
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Utils.DB = new ArmClothesEntities();
            currentMaterials = Utils.DB.Material.ToList();
            UpdateMaterials();
        }
    }
}
