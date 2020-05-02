using Group4_Lab4.DTL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group4_Lab4.DAL
{
    class BookDAO : DAO
    {
        static public DataTable GetDataTable()
        {
            String sql = "Select * from Book";
            return GetDataTable(sql);
        }

        static public DataTable getBookByTitle(String title)
        {
            string sql = "select * from book where title like '%" + title + "%'";
            return GetDataTable(sql);

        }

        static public DataTable getBookByNum(int num)
        {
            string sql = "select * from book where booknumber =" + num;
            return GetDataTable(sql);

        }

        static public bool Insert(Book b)
        {

            String sql = "INSERT dbo.Book(title,authors,publisher)" + Environment.NewLine +
                         "VALUES(@title, @authors, @publisher)";
            SqlCommand com = new SqlCommand(sql);
            //com.Parameters.AddWithValue("@bookNumber", b.BookNumber);
            com.Parameters.AddWithValue("@title", b.Title);
            com.Parameters.AddWithValue("@authors", b.Authors);
            com.Parameters.AddWithValue("@publisher", b.Publisher);
            return UpdateTable(com);
        }

        static public int GetBookNumberMax()
        {
            DataTable dt = GetDataTable();
            int res;
            if (dt.Rows.Count == 0)
            {
                res = 0;
            }
            else
            {
                res = (int)dt.Compute("max(bookNumber)", "");
            }
            return res;
        }


        static public bool Update(Book b)
        {
            String sql = "Update Book set title = @title, authors = @authors, publisher = @publisher where bookNumber = @bookNumber";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@title", b.Title);
            com.Parameters.AddWithValue("@authors", b.Authors);
            com.Parameters.AddWithValue("@publisher", b.Publisher);
            com.Parameters.AddWithValue("@bookNumber", b.BookNumber);
            return UpdateTable(com);
        }

        static public bool Delete(int BookNumber)
        {
            String sql = "delete from Book where bookNumber = @bookNumber";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@bookNumber", BookNumber);
            return UpdateTable(com);
        }

    }
}

