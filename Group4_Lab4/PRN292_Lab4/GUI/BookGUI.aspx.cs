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
    public partial class BookCopy : System.Web.UI.Page
    {
        //set static for reload page each time
        static Book bo;
        static Copy co;
        static bool checkAddBook = false; // user for book and copy
        //static bool checkAddCopy = false;
        static bool checkEditBook = false; // user for book and copy
        //static bool checkEditCopy = false;
        static bool copyExist;
        protected List<TextBox> GetTextBoxes()
        {
            return new List<TextBox> { txtTitle, txtAuthor, txtPublisher, txtTypecopy, txtPrice };
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                copyP.Style.Add("display", "none");
                copyExist = false;
                DataTable dt = BookDAO.GetDataTable();

                GridView1.DataSource = dt;
                ViewState["data1"] = dt;
                GridView1.DataBind();


                int maxBook = dt.Rows.Count;
                Label2.Text = maxBook.ToString();


            }
            else
            {

            }
        }

        //reload each action change grid view
        protected void reload()
        {
            // reload first path with book
            if (copyExist == false)
            {
                DataTable dt;
                if (Session["sortdata1"] == null)
                {
                    dt = BookDAO.GetDataTable();

                }
                else
                {
                    // set session from dataview so must to parse to dataview first 
                    dt = (Session["sortdata1"] as DataView).ToTable();

                }
                GridView1.DataSource = dt;
                ViewState["data1"] = dt;
                GridView1.DataBind();
                int maxBook = dt.Rows.Count;
                Label2.Text = maxBook.ToString();

                //ViewState["sortExp"] = "ASC";
            }
            //copy path 
            else
            {
                DataTable dt;
                if (Session["sortdata2"] == null)
                {
                    dt = CopyDAO.GetAllCopyByBookNumber(bo.BookNumber);
                }
                else
                {
                    dt = (Session["sortdata2"] as DataView).ToTable();
                }

                GridView2.DataSource = dt;
                ViewState["data2"] = dt;
                GridView2.DataBind();
                int maxCopy = dt.Rows.Count;
                Label7.Text = maxCopy.ToString();
                //ViewState["sortExp"] = "ASC";

            }

            lbErrorBook.Visible = false;
            lbErrorCopies.Visible = false;

        }

        //button select or delete on grid view
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Select")
            {
                //must add inside or else exception index=-1(default) occurs
                int index = Int32.Parse(e.CommandArgument.ToString());
                if (copyExist == false)
                {
                    GridViewRow gvRow = GridView1.Rows[index];

                    txtTitle.Text = gvRow.Cells[3].Text; //title
                    //default blank in gridview = &nbsp;
                    txtAuthor.Text = gvRow.Cells[4].Text.Trim().Equals("&nbsp;") ? "" : gvRow.Cells[4].Text; //author
                    txtPublisher.Text = gvRow.Cells[5].Text.Trim().Equals("&nbsp;") ? "" : gvRow.Cells[5].Text; //publisher



                    bo = new Book();
                    bo.BookNumber = Int32.Parse(gvRow.Cells[2].Text.ToString()); //book number
                }
                else
                {
                    GridViewRow gridViewRow = GridView2.Rows[index];

                    txtTypecopy.Text = gridViewRow.Cells[5].Text.ToString(); // type
                    txtPrice.Text = gridViewRow.Cells[6].Text.Equals("&nbsp;") ? "" : gridViewRow.Cells[6].Text; // price

                    co = new Copy();
                    co.CopyNumber = Int32.Parse(gridViewRow.Cells[2].Text.ToString());
                }


            }

            //delete
            if (e.CommandName == "Del")
            {
                int index = Int32.Parse(e.CommandArgument.ToString());
                if (copyExist == false)
                {
                    GridViewRow gvRow = GridView1.Rows[index];
                    int bookNum = Int32.Parse(gvRow.Cells[2].Text.ToString());
                    if (BookDAO.Delete(bookNum))
                    {
                        reload();
                    }
                    else
                    {
                        return;
                    }
                }
                else
                {
                    GridViewRow gridViewRow = GridView2.Rows[index];

                    int copyNum = Int32.Parse(gridViewRow.Cells[2].Text.ToString());
                    if (CopyDAO.Delete(copyNum))
                    {
                        reload();
                    }
                    else
                    {
                        return;
                    }
                }


            }
        }

        //button filter
        protected void Button1_Click(object sender, EventArgs e)
        {
            String filter = txtTitleFilter.Text.Trim();
            if (filter.Length == 0)
            {
                lbErrorBook.Text = "Please input title";
                lbErrorBook.Visible = true;
                return;
            }

            DataTable dt = BookDAO.getBookByTitle(filter);
            GridView1.DataSource = dt;
            ViewState["data1"] = dt;
            GridView1.DataBind();
            int maxBook = dt.Rows.Count;
            Label2.Text = maxBook.ToString();

            lbErrorBook.Visible = false;
        }


        //button add 

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (copyExist == false)
            {
                if (btSaveBook.Enabled == true)
                {
                    return;
                }


                btSaveBook.Enabled = true;
                btCancelBook.Enabled = true;
            }
            else
            {
                if (btCancelBook.Enabled == true)
                {
                    return;
                }


                btSaveCopies.Enabled = true; // save
                btCancelCopies.Enabled = true; // cancel
            }

            foreach (TextBox tb in GetTextBoxes())
            {

                tb.ReadOnly = false;

            }

            checkAddBook = true;


        }


        //button edit 

        protected void Button3_Click(object sender, EventArgs e)
        {
            //book
            if (copyExist == false)
            {
                if (btSaveBook.Enabled == true)
                {
                    return;
                }

                if (GridView1.SelectedRow == null)
                {
                    lbErrorBook.Text = "Please select one book";
                    lbErrorBook.Visible = true;
                    return;
                }

                btSaveBook.Enabled = true; // save
                btCancelBook.Enabled = true; // cancel

            }
            else
            //copies
            {
                if (btCancelBook.Enabled == true)
                {
                    return;
                }

                if (GridView2.SelectedRow == null)
                {
                    lbErrorCopies.Text = "Please select one copies";
                    lbErrorCopies.Visible = true;
                    return;
                }

                btSaveCopies.Enabled = true; // save
                btCancelCopies.Enabled = true; // cancel

            }
            foreach (TextBox tb in GetTextBoxes())
            {

                tb.ReadOnly = false;

            }

            checkEditBook = true;
            lbErrorBook.Visible = false;
            lbErrorCopies.Visible = false;

        }


        //button save 
        protected void Button5_Click(object sender, EventArgs e)
        {


            //edit
            if (checkEditBook == true)
            {
                //book
                if (copyExist == false)
                {
                    if (txtTitle.Text.Trim().Length == 0)
                    {
                        lbErrorTitleAdd.Text = "Please input title";
                        lbErrorTitleAdd.Visible = true;
                        return;
                    }
                    bo.Title = txtTitle.Text;
                    bo.Authors = txtAuthor.Text;
                    bo.Publisher = txtPublisher.Text;

                    if (!BookDAO.Update(bo))
                    {
                        return;
                    }
                    btSaveBook.Enabled = false;
                    btCancelBook.Enabled = false;
                }
                else
                {
                    //copy
                    if (txtTypecopy.Text.Trim().Length == 0)
                    {
                        lbErrorCopies.Text = "Please iput type A/F";
                        lbErrorCopies.Visible = true;
                        return;
                    }
                    co.Type = char.Parse(txtTypecopy.Text.ToUpper());
                    if (co.Type != 'A' && co.Type != 'F')
                    {
                        lbErrorCopies.Text = "Please iput type A/F";
                        lbErrorCopies.Visible = true;
                        return;
                    }
                    co.Price = double.Parse(txtPrice.Text);
                    co.BookNumber = int.Parse(GridView2.SelectedRow.Cells[3].Text);
                    co.CopyNumber = int.Parse(GridView2.SelectedRow.Cells[2].Text);
                    if (!CopyDAO.Update(co))
                    {
                        return;
                    }
                    btSaveCopies.Enabled = false;
                    btCancelCopies.Enabled = false;

                    txtTypecopy.ReadOnly = true;
                    txtPrice.ReadOnly = true;
                }

                
                

            }

            //add
            if (checkAddBook == true)
            {

                if (copyExist == false)
                {
                    if (txtTitle.Text.Trim().Length == 0)
                    {
                        lbErrorTitleAdd.Text = "Please input title";
                        lbErrorTitleAdd.Visible = true;
                        return;
                    }
                    bo = new Book();
                    bo.BookNumber = BookDAO.GetBookNumberMax() + 1;
                    bo.Title = txtTitle.Text;
                    bo.Authors = txtAuthor.Text;
                    bo.Publisher = txtPublisher.Text;
                    if (!BookDAO.Insert(bo))
                    {
                        return;
                    }
                    foreach (TextBox tb in GetTextBoxes())
                    {

                        tb.ReadOnly = true;

                    }
                    btSaveBook.Enabled = false;
                    btCancelBook.Enabled = false;
                }
                else
                {
                    if (txtTypecopy.Text.Trim().Length == 0)
                    {
                        lbErrorCopies.Text = "Please iput type A/F";
                        lbErrorCopies.Visible = true;
                        return;
                    }
                    String type = txtTypecopy.Text.Trim().ToUpper();
                    if (!type.Equals("A") && !type.Equals("F"))
                    {
                        lbErrorCopies.Text = "Please iput type A/F";
                        lbErrorCopies.Visible = true;
                        return;
                    }
                    co = new Copy();
                    co.CopyNumber = CopyDAO.GetCopyNumberMax() + 1;
                    co.BookNumber = Int32.Parse(txtBookNumberCopies.Text);
                    co.SequenceNumber = CopyDAO.GetSequenceNumberMax(co.BookNumber) + 1;
                    co.Type = char.Parse(type);
                    if(co.Type != 'A' && co.Type != 'F')
                    co.Price = double.Parse(txtPrice.Text.Trim().Length == 0 ? "0" : txtPrice.Text.Trim());
                    if (!CopyDAO.Insert(co))
                    {
                        return;
                    }
                }

                btSaveCopies.Enabled = false; // save
                btCancelCopies.Enabled = false; // cancel

            }


            foreach (TextBox tb in GetTextBoxes())
            {
                if (!checkEditBook)
                {
                    tb.Text = "";
                }
                tb.ReadOnly = true;

            }

            checkAddBook = false;
            checkEditBook = false;


            
            reload();
        }

        //button cancel
        protected void Button6_Click(object sender, EventArgs e)
        {

            foreach (TextBox tb in GetTextBoxes())
            {
                if (!checkEditBook)
                {
                    tb.Text = "";
                }

                tb.ReadOnly = true;

            }
            if (copyExist == false)
            {
                btSaveBook.Enabled = false;
                btCancelBook.Enabled = false;
            }
            else
            {
                btSaveCopies.Enabled = false;
                btCancelCopies.Enabled = false;
            }


            checkAddBook = false;
            checkEditBook = false;
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            //
        }


        //on paging 
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (copyExist == false)
            {
                GridView1.PageIndex = e.NewPageIndex;
            }
            else
            {
                GridView2.PageIndex = e.NewPageIndex;
            }

            reload();

        }


        //button to copy
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                lbErrorBook.Text = "Please select one book";
                lbErrorBook.Visible = true;
                return;
            }
            bookP.Style.Add("display", "none");
            copyP.Style.Add("display", "initial");
            copyExist = true;
            txtBookNumberCopies.Text = bo.BookNumber.ToString();
            txtTitleCopy.Text = txtTitle.Text;
            reload();

            lbErrorBook.Visible = false;
            lbErrorTitleAdd.Visible = false;
            lbErrorCopies.Visible = false;
        }

        protected DataTable getCloneGridView(GridView g)
        {
            DataTable dt = new DataTable();

            //header gridview
            for (int i = 1; i < g.HeaderRow.Cells.Count; ++i)
            {
                dt.Columns.Add(GridView1.HeaderRow.Cells[i].Text.Trim().ToString() == "" ? "" : GridView1.HeaderRow.Cells[i].Text);
            }

            //dataview gridview
            for (int i = 0; i < g.Rows.Count; ++i)
            {
                DataRow dr = dt.NewRow();
                for (int j = 0; j < g.HeaderRow.Cells.Count - 2; ++j)
                {
                    dr[j] = g.Rows[i].Cells[j + 2].Text.Trim().ToString() == "" ? "" : g.Rows[i].Cells[j].Text.Trim();
                }
                dt.Rows.Add(dr);
            }

            return dt;

        }


        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {


            if (copyExist == false)
            {
                if (GridView1.Rows.Count == 1)
                {
                    return;
                }

                //int psize = GridView1.PageSize;

                ////defaul pageindex = 0;
                //int pindex = GridView1.PageIndex + 1;

                DataTable dt = ViewState["data1"] as DataTable;

                DataView dv = new DataView(dt);

                if (Convert.ToString(ViewState["sortExp"]) == "ASC" || ViewState["sortExp"] == null)
                {
                    dv.Sort = e.SortExpression + " DESC";
                    ViewState["sortExp"] = "DESC";

                }
                else if (Convert.ToString(ViewState["sortExp"]) == "DESC")
                {
                    dv.Sort = e.SortExpression + " ASC";
                    ViewState["sortExp"] = "ASC";
                }

                Session["sortdata1"] = dv;
                GridView1.DataSource = dv;
                GridView1.DataBind();


            }
            else
            {
                if (GridView2.Rows.Count == 1)
                {
                    return;
                }

                DataTable dt = ViewState["data2"] as DataTable;
                DataView dv = new DataView(dt);

                if (Convert.ToString(ViewState["sortExp"]) == "ASC" || ViewState["sortExp"] == null)
                {
                    dv.Sort = e.SortExpression + " DESC";
                    ViewState["sortExp"] = "DESC";
                }
                else if (Convert.ToString(ViewState["sortExp"]) == "DESC")
                {
                    dv.Sort = e.SortExpression + " ASC";
                    ViewState["sortExp"] = "ASC";
                }
                Session["sortdata2"] = dv;
                GridView2.DataSource = dv;
                GridView2.DataBind();

            }


        }
    }
}