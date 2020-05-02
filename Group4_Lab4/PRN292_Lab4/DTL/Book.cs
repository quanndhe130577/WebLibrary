using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Group4_Lab4.DTL
{
    public class Book
    {
        private int bookNumber;

        public int BookNumber
        {
            get { return bookNumber; }
            set { bookNumber = value;  }
        }
        
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        private string publisher;

        public string Publisher
        {
            get { return publisher; }
            set { publisher = value; }
        }
        private string authors;

        public string Authors
        {
            get { return authors; }
            set { authors = value; }
        }

        public Book(int bookNumber, string title, string authors, string publisher)
        {
            this.bookNumber = bookNumber;
            this.title = title;
            this.authors = authors;
            this.publisher = publisher;
            
        }
        public Book()
        {

        }

        public override string ToString()
        {
            return (bookNumber.ToString() + '\t' + title + '\t' + authors + '\t' + publisher);
        }
 
    }
        
}
