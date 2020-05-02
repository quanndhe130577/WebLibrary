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
    class CopyDAO : DAO
    {
        static public Copy GetCopy(int CopyNumber)
        {
            String sql = "SELECT * FROM Copy WHERE copyNumber =  " + CopyNumber;
            DataTable dt = GetDataTable(sql);
            foreach(DataRow row in dt.Rows)
            {
                Copy c = new Copy(CopyNumber, int.Parse(row["bookNumber"].ToString()), int.Parse(row["sequenceNumber"].ToString()), Char.Parse(row["type"].ToString()), int.Parse(row["price"].ToString()));
                return c;
            }
            return null;
        }

        static public bool Update(Copy c)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Copy SET bookNumber = @bn, sequenceNumber = @sn, type = @t, price = @p WHERE copyNumber = @cn ");
            cmd.Parameters.AddWithValue("@bn", c.BookNumber);
            cmd.Parameters.AddWithValue("@sn", c.SequenceNumber);
            cmd.Parameters.AddWithValue("@t", c.Type);
            cmd.Parameters.AddWithValue("@p", c.Price);
            cmd.Parameters.AddWithValue("@cn", c.CopyNumber);
            return UpdateTable(cmd);
        }

        static public DataTable GetAllCopyByBookNumber(int bookNumber)
        {
            String sql = "SELECT * FROM Copy WHERE bookNumber = " + bookNumber;
            return GetDataTable(sql);
        }

        static public DataTable GetDataTable()
        {
            String sql = "Select * from Copy";
            return GetDataTable(sql);
        }

        static public int GetCopyNumberMax()
        {
            DataTable dt = GetDataTable();
            int res;
            if (dt.Rows.Count == 0)
            {
                res = 0;
            }
            else
            {
                res = (int)dt.Compute("max(copyNumber)", "");
            }
            return res;
        }

        static public int GetSequenceNumberMax(int bookNumber)
        {
            DataTable dt = GetAllCopyByBookNumber(bookNumber);
            int res;
            if (dt.Rows.Count == 0)
            {
                res = 0;
            }
            else
            {
                res = (int)dt.Compute("max(sequenceNumber)", "");
            }
            return res;
        }

        static public bool Insert(Copy c)
        {

            String sql = "INSERT dbo.Copy(bookNumber,sequenceNumber,type, price)" + Environment.NewLine +
                          "VALUES( @bookNumber, @sequenceNumber,  @type, @price )";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@bookNumber", c.BookNumber);
            com.Parameters.AddWithValue("@sequenceNumber", c.SequenceNumber);
            com.Parameters.AddWithValue("@type", c.Type);
            com.Parameters.AddWithValue("@price", c.Price);
            return UpdateTable(com);
        }

        static public bool Delete(int CopyNumber)
        {
            String sql = "delete from Copy where copyNumber = @copyNumber";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@copyNumber", CopyNumber);
            return UpdateTable(com);
        }
    }
}
