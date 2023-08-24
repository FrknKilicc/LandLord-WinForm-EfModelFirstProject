using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace modelfirstproje
{
    public partial class LandLords : Form
    {
        public LandLords()
        {
            InitializeComponent();
        }

        Model1Container mdl = new Model1Container();

        private void LandLords_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0)
            {

                dataGridView1.DataSource = mdl.ForRentals.ToList();
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;

            textBox1.Tag = satir.Cells["ForRentalID"].Value.ToString();
            textBox1.Text = satir.Cells["ForRentalID"].Value.ToString();

        }
    }
}
