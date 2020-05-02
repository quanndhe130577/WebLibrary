using Group4_Lab4.DAL;
using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_Lab4.GUI
{
    public partial class ReturnGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbError.Visible = false;
                displayButtons(1);
                Calendar1.SelectedDate = DateTime.Now;
            }

        }

        private void displayButtons(int state)
        {
            switch (state)
            {
                // to enter member and check Member
                case 1:
                    txtMemberCode.Enabled = true;
                    btCheckMember.Enabled = true;

                    btConfirmFine.Enabled = false;
                    GridView1.Enabled = true;

                    Calendar1.Enabled = false;
                    btReturn.Enabled = false;

                    //Session["display"] = 2;

                    break;
                // to Confirm fine
                case 2:
                    txtMemberCode.Enabled = false;
                    btCheckMember.Enabled = false;

                    btConfirmFine.Enabled = true;

                    Calendar1.Enabled = false;
                    btReturn.Enabled = false;

                    break;
                // to Return
                case 3:
                    txtMemberCode.Enabled = false;
                    btCheckMember.Enabled = false;

                    btConfirmFine.Enabled = false;
                    GridView1.Enabled = false;

                    Calendar1.Enabled = true;
                    Calendar1.SelectedDate = DateTime.Now;
                    btReturn.Enabled = true;

                    //Session["display"] = 1;
                    break;

            }

        }

        private void View()
        {
            lbNumberOfBorrowedBooks.Text = GridView1.Rows.Count.ToString();
            //DataTable dt = new CirculatedCopyDAO().GetBorrowedCopies(int.Parse(txtMemberCode.Text));
            //GridView1.DataSource = dt;
            //GridView1.DataBind();
            //this.GridView1.Columns["borrowedDate"].DefaultCellStyle.Format = "dd/MM/yyyy";
            //this.GridView1.Columns["dueDate"].DefaultCellStyle.Format = "dd/MM/yyyy";
            //this.GridView1.Columns["returnedDate"].DefaultCellStyle.Format = "dd/MM/yyyy";

        }
        protected void btCheckMember_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            lbNumberOfBorrowedBooks.Text = "0";
            lbError.Visible = false;
            int borrowerNumber;
            try
            {
                borrowerNumber = int.Parse(txtMemberCode.Text);
            }
            catch
            {
                lbError.Visible = true;
                lbError.Text = "Borrower number must be a integer!";
                txtMemberCode.Focus();
                return;
            }
            Borrower b = BorrowerDAO.GetBorrower(borrowerNumber);
            if (b == null)
            {
                lbError.Visible = true;
                lbError.Text = String.Format("Borrower number {0} does't exist!", borrowerNumber);
                txtMemberCode.Focus();
                return;
            }
           
            txtName.Text = b.Name;
            lbNumberOfBorrowedBooks.Text = GridView1.Rows.Count.ToString();
           // View();
            
        }


        private void Return(CirculatedCopy cc)
        {
            CirculatedCopyDAO.Update(cc);

            Copy c = CopyDAO.GetCopy(cc.CopyNumber);

            // if copy is reference
            if (c.Type == 'R') return;
            // update type = 'A' in copy
            c.Type = 'A';
            CopyDAO.Update(c);

        }

        protected void btConfirmFine_Click(object sender, EventArgs e)
        {
            displayButtons(3);
            
            double fine = (int)(DateTime.Now - Convert.ToDateTime(GridView1.SelectedRow.Cells[5].Text)).TotalDays;

            if (fine <= 0) txtFindAmount.Text = "0";
            else txtFindAmount.Text = fine.ToString("C2");

            displayButtons(3);
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            displayButtons(2);
        }

        protected void btReturn_Click(object sender, EventArgs e)
        {
            CirculatedCopy cc;

           
                double fine = 0;
                if (Calendar1.SelectedDate > Convert.ToDateTime(GridView1.SelectedRow.Cells[5].Text))
                    fine = (int)(DateTime.Now - Convert.ToDateTime(GridView1.SelectedRow.Cells[5].Text)).TotalDays;

                //fineTotal += fine;
                
                cc = new CirculatedCopy(int.Parse(GridView1.SelectedRow.Cells[2].Text), int.Parse(GridView1.SelectedRow.Cells[3].Text),
                    Convert.ToDateTime(GridView1.SelectedRow.Cells[4].Text), Convert.ToDateTime(GridView1.SelectedRow.Cells[5].Text));
                cc.Id = int.Parse(GridView1.SelectedRow.Cells[1].Text);
                cc.ReturnedDate = Calendar1.SelectedDate;
                cc.FineAmount = fine;

                Return(cc);

            //SqlDataSource1.DataBind();
            GridView1.DataBind();

            displayButtons(1);
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            lbNumberOfBorrowedBooks.Text = GridView1.Rows.Count.ToString();
        }
    }
}