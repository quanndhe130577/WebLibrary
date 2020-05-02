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
    public partial class WebForm1 : System.Web.UI.Page
    {
        //DataView dv;
        Copy c;
        Reservation r;

        enum errorBorrow
        {
            OK,
            Connect,
            CopyNotExist,
            CopyReferenced,
            CopyBorrowed,
            CopyReserved
        };

        protected void Page_Load(object sender, EventArgs e)
        {
           // copyDAO = new CirculatedCopyDAO();
            if (!IsPostBack)
            {
                
                displayButtons(1);
                Calendar1.SelectedDate = DateTime.Now;
                Calendar1.TodaysDate = DateTime.Now;
                lblError.Visible = false;
            }    
        }
        public void showData()
        {
            DataTable dt =  CirculatedCopyDAO.GetBorrowedCopies(int.Parse(txtBorrowerNumber.Text));
            lblNoOfBorrowedCopy.Text = dt.Rows.Count.ToString();

            DataView dv = new DataView(dt);
            GridView1.DataSource = dv;
            GridView1.DataBind();


        }
        protected void btnCheckButton_Click(object sender, EventArgs e)//check member
        {
            lblError.Visible = false;
            int borrowerNumber;
            try
            {
                borrowerNumber = int.Parse(txtBorrowerNumber.Text);
            }
            catch
            {
                lblError.Visible = true;
                lblError.Text = "Borrower number must be a integer!";
                txtBorrowerNumber.Focus();
                return;
            }
            Borrower b = BorrowerDAO.GetBorrower(borrowerNumber);
            if (b == null)
            {
                lblError.Visible = true;
                lblError.Text = String.Format("Borrower number {0} does't exist!", borrowerNumber);
                txtBorrowerNumber.Focus();
                return;
            }
            txtName.Text = b.Name;
            showData();
            
            int n = GridView1.Rows.Count;
            lblNoOfBorrowedCopy.Text = n.ToString();
            if (GridView1.Rows.Count >= 5)
            {
                lblError.Visible = true;
                lblError.Text = "You borrowed 5 books, so you can't borrow any more!";
                return;
            }
            displayButtons(2);
            c = null;
            r = null;
        }

        protected void btnCheckCondition_Click(object sender, EventArgs e)
        {
            int copyNumber = 0;
            try
            {
                copyNumber = int.Parse(txtCopyNumber.Text);
            }
            catch
            {
                lblError.Text = "Copy number must be a integer!";
                lblError.Visible = true;
                txtCopyNumber.Focus();
                return;
            }
            errorBorrow error = checkCondition(int.Parse(txtBorrowerNumber.Text), int.Parse(txtCopyNumber.Text), out c, out r);
            string str = "";
            switch (error)
            {
                case errorBorrow.CopyNotExist:
                    str = "No this copy number, so you can't borrow!";
                    break;
                case errorBorrow.CopyReferenced:
                    
                    str = "It is referenced, so you can't borrow!";
                    break;
                case errorBorrow.CopyBorrowed:
                    
                    str = "It is borrwed, so you can't borrow!";
                    break;
                case errorBorrow.CopyReserved:
                    
                    str = "It is reserved by other, so you can't borrow!";
                    break;
                case errorBorrow.Connect:
                    
                    str = "Can't connect to Database, so you can't borrow!";
                    break;

            }
            if (str != "")
            {
                lblError.Visible = true;
                lblError.Text = str;
                txtCopyNumber.Focus();
                return;
            }

            lblError.Visible = false;
            displayButtons(3);
        }

        protected void btnBorrow_Click(object sender, EventArgs e)
        {
            DateTime receiveDate = Calendar1.SelectedDate;
            DateTime dueDate = Calendar1.SelectedDate.AddDays(14);

            CirculatedCopy cc = new CirculatedCopy(int.Parse(txtCopyNumber.Text), int.Parse(txtBorrowerNumber.Text),
                receiveDate, dueDate);
            c = CopyDAO.GetCopy(int.Parse(txtCopyNumber.Text));
            r = r = ReserveDAO.GetFirstReservation(c.BookNumber);
            borrow(cc, c, r);

            showData();
            displayButtons(1);
        }

        private void borrow(CirculatedCopy cc, Copy c, Reservation r)
        {
            // Insert borrow record
            if (cc == null) return;
            CirculatedCopyDAO.Insert(cc);

            // update type = 'B' at Copy
            if (c == null) return;
            c.Type = 'B';
            CopyDAO.Update(c);


            // update status = 'A' at Reservation
            if (r == null) 
                return;
            r.Status = 'A';
            ReserveDAO.Update(r);


        }


        private void displayButtons(int state)
        {
            switch (state)
            {
                // to enter member and check member
                case 1:
                    txtBorrowerNumber.Enabled = true;
                    btnCheckButton.Enabled = true;

                    txtCopyNumber.Enabled = false;
                    btnCheckCondition.Enabled = false;

                    //txtBorrowedDate.Enabled = false;
                    Calendar1.Enabled = false;
                    btnBorrow.Enabled = false;
                    break;
                // to check condition
                case 2:
                    txtBorrowerNumber.Enabled = false;
                    btnCheckButton.Enabled = false;

                    txtCopyNumber.Enabled = true;
                    btnCheckCondition.Enabled = true;

                    //txtBorrowedDate.Enabled = false;
                    Calendar1.Enabled = false;
                    btnBorrow.Enabled = false;
                    break;
                // to borrow
                case 3:
                    txtBorrowerNumber.Enabled = false;
                    btnCheckButton.Enabled = false;

                    txtCopyNumber.Enabled = false;
                    btnCheckCondition.Enabled = false;

                    //txtBorrowedDate.Enabled = true;
                    Calendar1.Enabled = true;
                    btnBorrow.Enabled = true;
                    break;

            }

        }

        private errorBorrow checkCondition(int borrowerNumber, int copyNumber, out Copy c, out Reservation r)
        {
            c = null;
            r = null;


            c = CopyDAO.GetCopy(copyNumber);
            if (c == null) return errorBorrow.CopyNotExist;
            if (c.Type == 'R') return errorBorrow.CopyReferenced;
            if (c.Type == 'B') return errorBorrow.CopyBorrowed;

            // Check if this book is reserved by others and you are not at the first of the reservation list
            int bookNumber = c.BookNumber;
            r = ReserveDAO.GetFirstReservation(bookNumber);
            if (r != null && r.BorrowerNumber != borrowerNumber) return errorBorrow.CopyReserved;
               
            return errorBorrow.OK;

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dueDate = Calendar1.SelectedDate.AddDays(14);
            txtDueDate.Text = dueDate.ToString("dd/MM/yyyy");
            displayButtons(3);
        }
    }
}