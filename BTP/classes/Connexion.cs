using System;
using System.Data.SqlClient;
using System.Data;
namespace BTP.classes {
    public class Connexion {
        public string erreur { get; set; }
        public SqlConnection cx = new SqlConnection("Data Source=.\\SQLEXPRESS; Initial Catalog=BTP; Integrated Security=True;");
        SqlCommand comm;
        public void MajQueries(string request) {
            comm = new SqlCommand(request, cx);
            try {
                if (cx.State == ConnectionState.Closed) cx.Open();
                comm.ExecuteNonQuery();
            } catch (Exception ex) { erreur = ex.Message; }
            finally { if (cx.State != ConnectionState.Closed) cx.Close(); }
        }
        public DataTable SelectQueries(string request) {
            DataTable dt = new DataTable();
            comm = new SqlCommand(request, cx);
            try {
                if (cx.State == ConnectionState.Closed) cx.Open();
                dt.Load(comm.ExecuteReader());
                if (dt.Rows.Count == 0) { erreur = "Inexistant!"; }
            } catch (Exception ex) { erreur = ex.Message; }
            finally { if (cx.State != ConnectionState.Closed) cx.Close(); }
            return dt;
        }
        public bool VerifierQueries(string request) {
            object obj = new object();
            bool isExist = false;
            comm = new SqlCommand(request, cx);
            try {
                if (cx.State != ConnectionState.Open) cx.Open();
                obj = comm.ExecuteScalar();
                isExist = bool.Parse(obj.ToString());
                if (obj == null) { erreur = "Inexistant!"; }
            } catch(Exception ex) { erreur = ex.Message; }
            finally { if (cx.State != ConnectionState.Closed) cx.Close(); }
            return isExist;
        }
        public string ScalarQueries(string request)
        {
            object obj = new object();
            comm = new SqlCommand(request, cx);
            try
            {
                if (cx.State != ConnectionState.Open) cx.Open();
                obj = comm.ExecuteScalar();
            }
            catch (Exception ex) { erreur = ex.Message; }
            finally { if (cx.State != ConnectionState.Closed) cx.Close(); }
            return obj.ToString();
        }
        public void ProcQueries(string procName, string username, string password, string type)
        {
            comm = new SqlCommand(procName, cx);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.AddWithValue("@username", username);
            comm.Parameters.AddWithValue("@pass", password);
            comm.Parameters.AddWithValue("@ty", type);
            try
            {
                if (cx.State != ConnectionState.Open) cx.Open();
                comm.ExecuteNonQuery();
            }
            catch (Exception ex) { erreur = ex.Message; }
            finally { if (cx.State != ConnectionState.Closed) cx.Close(); }
        }
    }
}