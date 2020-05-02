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
    class ReserveDAO : DAO
    {
        static public bool Insert(Reservation r)
        {

            String sql = "INSERT dbo.Reservation(borrowerNumber,bookNumber,date, status)" + Environment.NewLine +
                          "VALUES( @borrowerNumber, @bookNumber,  @date, @status )";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@borrowerNumber", r.BorrowerNumber);
            com.Parameters.AddWithValue("@bookNumber", r.BookNumber);
            com.Parameters.AddWithValue("@date", r.Date);
            com.Parameters.AddWithValue("@status", r.Status);
            return UpdateTable(com);
        }

        static public bool Update(Reservation r)
        {

            String sql = "Update [Reservation] set borrowerNumber = @brn, bookNumber = @bnn, date = @d, status = @s where id = @i ";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@brn", r.BorrowerNumber);
            com.Parameters.AddWithValue("@bnn", r.BookNumber);
            com.Parameters.AddWithValue("@d", r.Date);
            com.Parameters.AddWithValue("@s", r.Status);
            com.Parameters.AddWithValue("@i", r.Id);
            return UpdateTable(com);
        }


        static public Reservation GetFirstReservation(int bookNumber)
        {
            String sql = "SELECT TOP (1) * FROM [Reservation] WHERE bookNumber = " + bookNumber + " and status = 'R' ORDER BY date asc";
            DataTable dt = GetDataTable(sql);
            foreach (DataRow row in dt.Rows)
            {
                Reservation r = new Reservation(int.Parse(row["borrowerNumber"].ToString()), int.Parse(row["bookNumber"].ToString()), DateTime.Parse(row["date"].ToString()));
                r.Id = int.Parse(row["id"].ToString());
                return r;
            }
            return null;
        }

        static public DataTable SelectDS(int borrowerNumber, char c)
        {
            String sql = "SELECT * FROM [Reservation] WHERE status = '"+c+"' and borrowerNumber = " + borrowerNumber;
            return GetDataTable(sql);
        }
    }
}
