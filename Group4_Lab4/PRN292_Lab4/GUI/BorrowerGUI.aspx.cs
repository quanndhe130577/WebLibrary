using Group4_Lab4.DAL;
using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group4_Lab4.GUI
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["borrower"] != null)
            {
                GridViewRow vrow = (GridViewRow)Session["borrower"];
                //txtName.Text = vrow.Cells[2].Text;
                //txtSex.Text = vrow.Cells[3].Text;
                
            }
            displayButtons(1);
        }

        private void displayButtons(int state)
        {
            switch (state)
            {
                // View
                case 1:

                    txtName.Enabled = false;
                    txtSex.Enabled = false;
                    txtAdd.Enabled = false;
                    txtEmail.Enabled = false;
                    txtPhone.Enabled = false;

                    btnAdd.Enabled = true;
                    btnEdit.Enabled = true;

                    btnSave.Enabled = false;
                    btnCancel.Enabled = false;
                    break;

                // Adding or editing
                case 2:
                    txtName.Enabled = true;
                    txtSex.Enabled = true;
                    txtAdd.Enabled = true;
                    txtEmail.Enabled = true;
                    txtPhone.Enabled = true;

                    btnAdd.Enabled = false;
                    btnEdit.Enabled = false;

                    btnSave.Enabled = true;
                    btnCancel.Enabled = true;

                    break;

            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Session["add"] = 1;
            displayButtons(2);

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            lblNumberOfRow.Text = GridView1.Rows.Count.ToString();
        
    }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                lblError.Text = "Error: No a Borroewer is selected!";
                return;
            }
            Session["add"] = 2;
            displayButtons(2);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int add = (int)Session["add"];
            int borrowerNumber = (int)Session["borrowerNumber"];
            Borrower c = new Borrower();
            c.BorrowerNumber = borrowerNumber;
            c.Name = txtName.Text;
            c.Sex = txtSex.Text.ToCharArray()[0];
            c.Address = txtAdd.Text;
            c.Telephone = txtPhone.Text;
            c.Email = txtEmail.Text;
            if (add == 1)
                BorrowerDAO.Insert(c);
            else
            {

                BorrowerDAO.Edit(c);
            }
            ObjectDataSource1.Select();
            GridView1.DataBind();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["borrowerNumber"] = int.Parse(GridView1.SelectedRow.Cells[1].Text);
            txtName.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[2].Text);
            txtSex.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[3].Text);
            txtAdd.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[4].Text);        
            txtPhone.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[5].Text);
            txtEmail.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[6].Text);

        }
        /*
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
        */
  
        /*
        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
           // int borrowerNumber = int.Parse(GridView1.Rows[10].Cells[1].Text);
           
            //new BorrowerDAO().Delete(borrowerNumber);

        }
        */
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           // String id =GridView1.DataKeys[e.RowIndex].ToString();
           // txtName.Text = id;
           // SqlCommand cmd = new SqlCommand("delete from borrower where borrowerNumber = @num");
           // cmd.Parameters.AddWithValue("@num", id);
           // DAO.UpdateTable(cmd);
        }
    }
}