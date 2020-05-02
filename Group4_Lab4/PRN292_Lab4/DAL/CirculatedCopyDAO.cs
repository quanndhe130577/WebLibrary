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
    class CirculatedCopyDAO : DAO
    {
        static public DataTable GetBorrowedCopies(int borrowerNumber)
        {
            String sql = "SELECT * FROM [CirculatedCopy] WHERE borrowerNumber = " + borrowerNumber + " and returnedDate is null ORDER BY returnedDate asc";
            return GetDataTable(sql);
        }

        static public void Update(CirculatedCopy cc)
        {
            SqlCommand cmd = new SqlCommand("UPDATE CirculatedCopy SET copyNumber = @cn , borrowerNumber = @bn, borrowedDate = @bd, dueDate = @dd, returnedDate = @rd, fineAmount = @fa WHERE ID = @i ");
            cmd.Parameters.AddWithValue("@cn", cc.CopyNumber);
            cmd.Parameters.AddWithValue("@bn", cc.BorrowerNumber);
            cmd.Parameters.AddWithValue("@bd", cc.BorrowedDate);
            cmd.Parameters.AddWithValue("@dd", cc.DueDate);
            cmd.Parameters.AddWithValue("@rd", cc.ReturnedDate);
            cmd.Parameters.AddWithValue("@fa", cc.FineAmount);
            cmd.Parameters.AddWithValue("@i", cc.Id);
            UpdateTable(cmd);
        }
        static public bool Insert(CirculatedCopy cc)
        {

            String sql = "INSERT dbo.CirculatedCopy(copyNumber, borrowerNumber, borrowedDate, dueDate)" + Environment.NewLine +
                          "VALUES( @copyNumber,  @borrowerNumber, @borrowerDate,  @dueDate )";
            SqlCommand com = new SqlCommand(sql);
            com.Parameters.AddWithValue("@copyNumber", cc.CopyNumber);
            com.Parameters.AddWithValue("@borrowerNumber", cc.BorrowerNumber);
            com.Parameters.AddWithValue("@borrowerDate", cc.BorrowedDate);
            com.Parameters.AddWithValue("@dueDate", cc.DueDate);

            return UpdateTable(com);
        }
    }
}
