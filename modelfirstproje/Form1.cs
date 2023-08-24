using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace modelfirstproje
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        Model1Container rEstate = new Model1Container();
        CustomerPage cPage = new CustomerPage();
        private void Form1_Load(object sender, EventArgs e)
        {
            // 4 tablolu ilişkili modelfirst proje
            //crud + arama
            //combobox kullan


        }


        bool login(string userrname, int age)

        {


            var query = from cust in rEstate.Customers where cust.NameSurname == userrname && cust.Age == age select cust;

            if (query.Any())
            {

                return true;

            }
            else
            {


                return false;

            }
        }

        bool LandLordlogin(string userrname, int age)

        {


            var query = from landlord in rEstate.LandLords where landlord.NameSurname == userrname && landlord.Age == age select landlord;

            if (query.Any())
            {

                return true;

            }
            else
            {


                return false;

            }
        }

        public void button1_Click(object sender, EventArgs e)
        {
            

            if (login(textBox1.Text, Convert.ToInt32(textBox2.Text)))
            {

                MessageBox.Show("Giriş Başarılı ");
                cPage.Show();
                

            }
            else
            {
                MessageBox.Show("Giriş Başarısız Kullanıcı Adı yada şifre hatalı");
                //foreach (Control item in Controls)
                //{
                //    if (item is TextBox)
                //    {

                //    }
                //}
            }




        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (LandLordlogin(textBox4.Text, Convert.ToInt32(textBox3.Text)))
            {
                LandLords page = new LandLords();
                page.Show();

                MessageBox.Show("Giriş Başarılı");

            }
            else
            {

                MessageBox.Show("Giriş Başarısız");
            }
        }
    }
}

