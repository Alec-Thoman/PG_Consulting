using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab2
{
    public class User
    {
        private string userName;
        private string passWord;
        public int userID { get; set; }

        private static int nextID = 100;
        public User(string userName, string passWord)
        {
            this.userName = userName;
            this.passWord = passWord;
            this.userID = nextID++;
        }

        public string UserName
        {
            get
            {
                return userName;
            }

            set
            {
                userName = value;
            }
        }

        public string PassWord
        {
            get
            {
                return this.passWord;
            }

            set
            {
                this.passWord = value;
            }
        }

    }
}