using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using PhoneBook.Modules;

namespace PhoneBook
{
    public partial class Form1 : Form
    {

     public   PhonebookEntities db = new PhonebookEntities();
        public int eID;
        private void FillDepartmentCombo() {

            foreach (Department d in db.Departments.ToList())
            {
                CmbDepartment.Items.Add(d.Name);
            }
        }
        private void FillEmpDgv (Employee em)
        {
            //DgvEmployes.Rows.Clear();
            DgvEmployes.Rows.Add(em.EmployeeId,
                                                     em.Name,
                                                     em.Surname,
                                                     em.Department.Name,
                                                     em.Position.Name,
                                                     em.Phone,
                                                     em.Email);
        }
        private void FillPositionCombo() {
            CmbPositions.Text = "";
            string department = CmbDepartment.Text;
            if (!string.IsNullOrEmpty(department))
            {
                foreach (Position p in db.Positions)
                {
                    if (p.Department.Name==department)
                    {
                        CmbPositions.Items.Add(p.Name);
                    }
                }
            }

        }
        public Form1()
        {
            InitializeComponent();
            FillDepartmentCombo();

        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            DgvEmployes.Rows.Clear();
            string Search = txtSearch.Text;
            db.SaveChangesAsync();
            MessageBox.Show("Gelir");
            foreach (Employee empl in db.Employees.ToList())
            {
                if (empl.Name.ToLower().Contains(Search.ToLower())||empl.Surname.ToLower().Contains(Search.ToLower()))
                {
                    FillEmpDgv(empl);
                }
            }

        }

        private void CmbDepartment_SelectedValueChanged(object sender, EventArgs e)
        {
            CmbPositions.Items.Clear();
            FillPositionCombo();
        }

        private void btnCustomSearch_Click(object sender, EventArgs e)
        {
            DgvEmployes.Rows.Clear();
            string department = CmbDepartment.Text;
            string position = CmbPositions.Text;
          
                if (string.IsNullOrEmpty(CmbDepartment.Text))
                {
                    foreach (Employee em in db.Employees.ToList())

                    {
                    if (em.isActive==true)
                    {
                        FillEmpDgv(em);

                    }
                     

                    }
            }
            else if (!string.IsNullOrEmpty(CmbDepartment.Text)&& string.IsNullOrEmpty(CmbPositions.Text))
            {
                foreach (Employee emp in db.Employees.ToList())
                {
                    if (emp.isActive==true&&emp.Department.Name==department)
                    {
                        FillEmpDgv(emp);
                    }     
                }
                   
            } else
            {
                foreach (Employee empl in db.Employees.ToList())
                {
                    if (empl.isActive==true&&empl.Department.Name==department&&empl.Position.Name==position)
                    {
                        FillEmpDgv(empl);
                    }
                }
            }



               
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            AddUser f = new AddUser();
            f.ShowDialog();
        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (DgvEmployes.SelectedRows.Count==0)
            {
                MessageBox.Show("İstifadəçi siyahidan seçilməlidir!","Səhv",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
            else if (DgvEmployes.SelectedRows.Count>1)
            {
                MessageBox.Show("Eyni vaxtda yalnız bir istifadəçi məlumatının dəyişilməsi mümkündür!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                AddUser f = new AddUser();
                f.Text = "Məlumatların dəyişilməsi";
                foreach (Control c in f.Controls)
                    if (c.Name == "btnAddNewEmployee")
                        c.Text = "Yenilə";
                f.eID = Convert.ToInt32( DgvEmployes.SelectedRows[0].Cells[0].Value);

                f.ShowDialog();
            }
           

            
        }

        private void btnAllContact_Click(object sender, EventArgs e)
        {
            DgvEmployes.Rows.Clear();
            foreach (Employee em in db.Employees.ToList())
            {
                DgvEmployes.EndEdit();
                DgvEmployes.Update();
                DgvEmployes.Refresh();
                FillEmpDgv(em);
                DgvEmployes.Refresh();
            }
        }
    }
}
