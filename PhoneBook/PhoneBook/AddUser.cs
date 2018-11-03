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
using System.Net.Mail;

namespace PhoneBook
{
    public partial class AddUser : Form
    {
        Form1 f = new Form1();
        public int eID { get; set; }
        //PhonebookEntities db = new PhonebookEntities();
        public AddUser()
        {   
            InitializeComponent();
            FillDepartmentCombo();
        }
        private bool IsEmailValid(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
        private void FillDepartmentCombo()
        {
            foreach (Department d in f.db.Departments.ToList())
            {
                cmbDepatments.Items.Add(d.Name);
            }
        }

        private void cmbDepatments_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbPositions.Items.Clear();
            string Department = cmbDepatments.Text;
            if (!string.IsNullOrEmpty(Department))
            {
                foreach (Position pos in f.db.Positions.ToList())
                {
                    if (Department==pos.Department.Name)
                    {
                        cmbPositions.Items.Add(pos.Name);
                    }
                }
            }
        }

        private void btnAddNewEmployee_Click(object sender, EventArgs e)
        {



            if (string.IsNullOrEmpty(txtName.Text))
            {   
                
               
                MessageBox.Show("İşçinin adını daxil edin!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (string.IsNullOrEmpty(txtSurname.Text))
            {
                MessageBox.Show("İşçinin soyadını daxil edin!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (string.IsNullOrEmpty(cmbDepatments.Text))
            {
                MessageBox.Show("İşçinin filialını seçin!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (string.IsNullOrEmpty(cmbPositions.Text))
            {
                MessageBox.Show("İşçinin soyadını vəzifəsini seçin!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (string.IsNullOrEmpty(txtPhone.Text))
            {
                MessageBox.Show("İşçinin telefon nömrəsini daxil edin!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else if (string.IsNullOrEmpty(txtEmail.Text)||!IsEmailValid(txtEmail.Text)||!txtEmail.Text.Contains("."))
            {
                MessageBox.Show("Email düzgün formatda daxil edilməyib!", "Səhv", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            else
            {
               
                if (btnAddNewEmployee.Text== "Yenilə") {
                   

                    var dbEmployee = f.db.Employees.Where(x => x.EmployeeId == eID).FirstOrDefault<Employee>();
                    dbEmployee.Name = txtName.Text;
                    dbEmployee.Surname = txtSurname.Text;
                    dbEmployee.DepartmentID= f.db.Departments.FirstOrDefault(x => x.Name == cmbDepatments.Text).DepartmentId;
                    dbEmployee.PositionID= f.db.Positions.FirstOrDefault(p => p.Name == cmbPositions.Text).PositionId;
                    dbEmployee.Phone = txtPhone.Text;
                    dbEmployee.Email = txtEmail.Text; 
                    f.db.SaveChangesAsync();
                   
                    this.Close();



                }
                else {
                    Employee nemEmpl = new Employee();
                    nemEmpl.Name = txtName.Text;
                    nemEmpl.Surname = txtSurname.Text;
                    nemEmpl.isActive = true;
                    nemEmpl.Phone = txtPhone.Text;
                    nemEmpl.Email = txtEmail.Text;
                    nemEmpl.DepartmentID = f.db.Departments.FirstOrDefault(x => x.Name == cmbDepatments.Text).DepartmentId;
                    nemEmpl.PositionID = f.db.Positions.FirstOrDefault(p => p.Name == cmbPositions.Text).PositionId;
                    f.db.Employees.Add(nemEmpl);
                    f.db.SaveChanges();
                    MessageBox.Show("Yeni işçi uğurla əlavə edildi!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();

                }


            }
        }

        private void AddUser_Load(object sender, EventArgs e)
        {
            if (btnAddNewEmployee.Text== "Yenilə")
            {
                Employee upd = new Employee();
                foreach (Employee em in f.db.Employees.ToList())
                {
                    if (em.EmployeeId==eID)
                    {
                        upd = em;
                    }
                }

                txtName.Text = upd.Name;
                txtSurname.Text = upd.Surname;
                cmbDepatments.Text = upd.Department.Name;
                cmbPositions.Text = upd.Position.Name;
                txtPhone.Text = upd.Phone;
                txtEmail.Text = upd.Email;
            }
        }
    }
}
