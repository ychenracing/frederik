package cn.edu.fudan.model.cn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.fudan.entity.News;
import cn.edu.fudan.entity.cn.CnNews;
import cn.edu.fudan.model.DAO;

public class CnModifyNews {
	private DAO dao = new DAO();
	private ResultSet rs;
	private StringBuilder sql;

	public CnNews getById(int id){
		CnNews news=null;
		sql = new StringBuilder();
		sql.append("select * from cnnews where id=");
		sql.append(id);
		try {
			dao.con();
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				news = new CnNews();
				news.setId(Integer.valueOf(rs.getString(1)));
				news.setTitle(rs.getString(2));
				news.setCover(rs.getString(3));
				news.setBrief(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setAddtime(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return news;
	}
	
	public boolean deleteById(int id){
		boolean success=false;
		sql = new StringBuilder();
		sql.append("delete from cnnews where id=");
		sql.append(id);
		try {
			dao.con();
			if(dao.stmt.executeUpdate(sql.toString())!=0)success=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return success;
	}
	
	public List<CnNews> getAll(){
		List<CnNews> lsn = new ArrayList<CnNews>();
		sql = new StringBuilder();
		sql.append("select * from cnnews order by addtime desc");
		try {
			try {
				dao.con();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = dao.stmt.executeQuery(sql.toString());
			while (rs.next()) {
				CnNews news = new CnNews();
				news.setId(Integer.valueOf(rs.getString(1)));
				news.setTitle(rs.getString(2));
				news.setCover(rs.getString(3));
				news.setBrief(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setAddtime(rs.getString(6));
				lsn.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lsn;
	}

	public List<CnNews> getByLimit(int start,int limitation){
		boolean success=false;
		List<CnNews> lsn = new ArrayList<CnNews>();
		sql = new StringBuilder();
		sql.append("select * from cnnews limit ");
		sql.append(start);
		sql.append(",");
		sql.append(limitation);
		try {
			try {
				dao.con();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = dao.stmt.executeQuery(sql.toString());
			while (rs.next()) {
				success=true;
				CnNews news = new CnNews();
				news.setId(Integer.valueOf(rs.getString(1)));
				news.setTitle(rs.getString(2));
				news.setCover(rs.getString(3));
				news.setBrief(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setAddtime(rs.getString(6));
				lsn.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(success)
		    return lsn;
		else return null;
	}
	
	public List<CnNews> getLatestByLimit(int limitation){
		List<CnNews> lsn = new ArrayList<CnNews>();
		sql = new StringBuilder();
		sql.append("select * from cnnews order by addtime desc limit ");
		sql.append(limitation);
		try {
			try {
				dao.con();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = dao.stmt.executeQuery(sql.toString());
			while (rs.next()) {
				CnNews news = new CnNews();
				news.setId(Integer.valueOf(rs.getString(1)));
				news.setTitle(rs.getString(2));
				news.setCover(rs.getString(3));
				news.setBrief(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setAddtime(rs.getString(6));
				lsn.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lsn;
	}
	
	public List<CnNews> getByTitle(String title){
		List<CnNews> lsn = new ArrayList<CnNews>();
		sql = new StringBuilder();
		sql.append("select * from cnnews where title like '%");
		sql.append(title);
		sql.append("%'");
		try {
			try {
				dao.con();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = dao.stmt.executeQuery(sql.toString());
			while (rs.next()) {
				CnNews news = new CnNews();
				news.setId(Integer.valueOf(rs.getString(1)));
				news.setTitle(rs.getString(2));
				news.setCover(rs.getString(3));
				news.setBrief(rs.getString(4));
				news.setContent(rs.getString(5));
				news.setAddtime(rs.getString(6));
				lsn.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lsn;
	}
	
	public boolean insertNewNews(CnNews news){
		boolean success=false;
		sql = new StringBuilder();
		sql.append("insert into cnnews(title,");
		if(news.getCover()!=null){
			sql.append("cover,");
		}
		if(news.getBrief()!=null){
			sql.append("brief,");
		}
		sql.append("content,addtime) values('");
		sql.append(news.getTitle());
		sql.append("','");
		if(news.getCover()!=null){
			sql.append(news.getCover());
			sql.append("','");
		}
		if(news.getBrief()!=null){
			sql.append(news.getBrief());
			sql.append("','");
		}
		sql.append(news.getContent());
		sql.append("','");
		sql.append(news.getAddtime());
		sql.append("')");
		try {
			try {
				dao.con();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(dao.stmt.executeUpdate(sql.toString())!=0)success=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return success;
	}
	
	public boolean updateById(CnNews news) {
		boolean success=false;
		sql = new StringBuilder();
		sql.append("update cnnews set ");
		if(news.getTitle()!=null){
			sql.append("title='");
			sql.append(news.getTitle());
			sql.append("',");
		}
		if(news.getCover()!=null){
			sql.append("cover='");
			sql.append(news.getCover());
			sql.append("',");
		}
		if(news.getBrief()!=null){
			sql.append("brief='");
			sql.append(news.getBrief());
			sql.append("',");
		}
		if(news.getContent()!=null){
			sql.append("content='");
			sql.append(news.getContent());
			sql.append("',");
		}
		if(news.getAddtime()!=null){
			sql.append("addtime='");
			sql.append(news.getAddtime());
			sql.append("',");
		}
		sql.setLength(sql.length()-1);
		sql.append(" where id=");
		sql.append(news.getId());
		try {
			dao.con();
			System.out.println(sql.toString());
			if(dao.stmt.executeUpdate(sql.toString())!=0)success=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return success;
	}
}
