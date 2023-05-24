using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;
using AjaxControlToolkit.HtmlEditor.Popups;
using AjaxControlToolkit;

public partial class _Default : Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            LoadRecord();
        }

    }
    SqlConnection _connection = new SqlConnection("server=DESKTOP-4EQ2IC4; database= StudentDetails; Trusted_connection=true; TrustServerCertificate=True;");
    SqlCommand _command = null;

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int queryResult = 0;
        
        _command = _connection.CreateCommand();
        _command = _connection.CreateCommand();
        _command.CommandType = CommandType.StoredProcedure;
        _command.CommandText = "[DBO].[use_Insert_Student]";
        _command.Parameters.AddWithValue("@FirstName", firstID.Text);
        _command.Parameters.AddWithValue("@LastName", lastID.Text);
        _command.Parameters.AddWithValue("@Number", numberID.Text);

        _connection.Open();
        queryResult = _command.ExecuteNonQuery();
        _connection.Close();
               
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
        LoadRecord();
    }

   void LoadRecord()
    {
        _command = _connection.CreateCommand();
        _command = _connection.CreateCommand();
        _command.CommandType = CommandType.StoredProcedure;
        _command.CommandText = "[DBO].[use_Get_StudentDetails]";
        SqlDataAdapter adapter = new SqlDataAdapter(_command);
        DataTable dataTable = new DataTable();
        adapter.Fill(dataTable);
        GridView1.DataSource = dataTable;
        GridView1.DataBind();

    }

    protected void btnnew_Click(object sender, EventArgs e)
    {
        firstID.Text = string.Empty;  
        lastID.Text = string.Empty;
        numberID.Text = string.Empty; 
    }

}
