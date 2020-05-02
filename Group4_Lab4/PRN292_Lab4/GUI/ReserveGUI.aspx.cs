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
    public partial class ReserveGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayButtons(1);
                Calendar1.SelectedDate = DateTime.Now;
                lbError.Visible = false;
            }
            
        }

        private void View()
        {
            DataTable dt = ReserveDAO.SelectDS(int.Parse(txtMemberCode.Text), 'R');

            GridView1.DataSource = dt;
            GridView1.DataBind();
            int n = GridView1.Rows.Count ;
            if (n < 0) lbNumberOfReservedBooks.Text = "0";
            else
            {
                lbNumberOfReservedBooks.Text = n.ToString();
            }
            
        }

        private void displayButtons(int state)
        {
            switch (state)
            {
                // to enter member and check member
                case 1:
                    txtMemberCode.Enabled = true;
                    btCheckMember.Enabled = true;

                    txtBookNumber.Enabled = false;
                    btCheckReservation.Enabled = false;

                    Calendar1.Enabled = false;
                    btReserve.Enabled = false;
                    break;
                // to check condition
                case 2:
                    txtMemberCode.Enabled = false;
                    btCheckMember.Enabled = false;

                    txtBookNumber.Enabled = true;
                    btCheckReservation.Enabled = true;

                    Calendar1.Enabled = false;
                    btReserve.Enabled = false;
                    break;
                // to borrow
                case 3:
                    txtMemberCode.Enabled = false;
                    btCheckMember.Enabled = false;

                    txtBookNumber.Enabled = false;
                    btCheckReservation.Enabled = false;

                    Calendar1.SelectedDate = DateTime.Now;
                    Calendar1.Enabled = true;
                    btReserve.Enabled = true;
                    break;

            }

        }

        protected void btCheckMember_Click(object sender, EventArgs e)
        {
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

            View();
            if (GridView1.Rows.Count >= 1)
            {
                lbError.Visible = true;
                lbError.Text = "You has already reserved !!!";
                txtMemberCode.Focus();
                return;
            }
            displayButtons(2);
        }

        private bool checkCondition(int borrowerNumber, int bookNumber)
        {
            lbError.Visible = false;
            DataTable dt = CopyDAO.GetAllCopyByBookNumber(bookNumber);
            if (dt.Rows.Count == 0)
            {
                lbError.Visible = true;
                lbError.Text = "Book Number has not existed !!";
                txtBookNumber.Focus();
                return false;
            }
            foreach (DataRow rd in dt.Rows)
            {
                
                if (rd["type"].ToString().Equals("A"))
                {
                    lbError.Visible = true;
                    lbError.Text = "The book is available !!!" ;
                    return false;
                }
            }
            foreach (DataRow rd in dt.Rows)
            {
                if (rd["type"].ToString().Equals("B"))
                { 
                    return true;
                }


            }

            lbError.Text = "All copy is reference !!!";
            return false;
        }
        protected void btCheckReservation_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            int bookNumber = int.Parse(txtBookNumber.Text);
            int borrowerNumber = int.Parse(txtMemberCode.Text);
            DataTable dt1 = BookDAO.getBookByNum(bookNumber);
            foreach (DataRow dr in dt1.Rows)
            {
                txtTitle.Text = dr["title"].ToString();
            }

            if (!checkCondition(borrowerNumber, bookNumber))
            {
                return;
            }
            displayButtons(3);
        }

        protected void btReserve_Click(object sender, EventArgs e)
        {
            Reservation rs = new Reservation(int.Parse(txtMemberCode.Text), int.Parse(txtBookNumber.Text), Calendar1.SelectedDate);
            ReserveDAO.Insert(rs);

            View();

            displayButtons(1);
        }
    }
}