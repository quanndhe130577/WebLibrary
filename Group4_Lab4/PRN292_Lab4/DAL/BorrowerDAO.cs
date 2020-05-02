
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
    class BorrowerDAO : DAO
    {
        static public DataTable getAllMember()
        {
            String sql = "Select * from Borrower";
            return GetDataTable(sql);
        }

        static public bool Insert(Borrower b)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[Borrower]([name],[sex],[address],[telephone],[email]) VALUES (@n, @s, @a, @t, @e)");
            //cmd.Parameters.AddWithValue("@bn", b.BorrowerNumber);
            cmd.Parameters.AddWithValue("@n", b.Name);
            cmd.Parameters.AddWithValue("@s", b.Sex);
            cmd.Parameters.AddWithValue("@a", b.Address);
            cmd.Parameters.AddWithValue("@t", b.Telephone);
            cmd.Parameters.AddWithValue("@e", b.Email);
            return UpdateTable(cmd);
        }

        static public int GetBorrowerNumberMax()
        {
            DataTable dt = getAllMember();
            if (dt.Rows.Count == 0) return 0;
            else return (int)(dt.Compute("max(borrowerNumber)", ""));
        }

        static public bool Delete(int b)
        {
                SqlCommand cmd = new SqlCommand("DELETE FROM [dbo].[Borrower] WHERE borrowerNumber = @b");
                cmd.Parameters.AddWithValue("@b", b);
         return UpdateTable(cmd);
    }
        static public bool Edit(Borrower b)
        {
            SqlCommand cmd = new SqlCommand("UPDATE [dbo].[Borrower]  SET [name] = @n ,[sex] = @s,[address] =@a " +
                ",[telephone] =@t  ,[email] =@e WHERE borrowerNumber=@b");
            cmd.Parameters.AddWithValue("@n", b.Name);
            cmd.Parameters.AddWithValue("@s", b.Sex);
            cmd.Parameters.AddWithValue("@a", b.Address);
            cmd.Parameters.AddWithValue("@t", b.Telephone);
            cmd.Parameters.AddWithValue("@e", b.Email);
            cmd.Parameters.AddWithValue("@b", b.BorrowerNumber);
            return UpdateTable(cmd);
        }

        static public Borrower GetBorrower(int borrowNumber)
        {
            String sql = " SELECT * FROM Borrower WHERE borrowerNumber = " + borrowNumber;
            DataTable dt = GetDataTable(sql);
            
            if (dt.Rows.Count == 0) return null;
            else
            {
                foreach (DataRow row in dt.Rows)
                {
                    Borrower br = new Borrower(borrowNumber, row["name"].ToString(), Char.Parse(row["sex"].ToString()), row["address"].ToString(), row["telephone"].ToString(), row["email"].ToString());
                    return br;
                }
            }
            return null;
        }

    }

}
