package cn.edu.fudan.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.fudan.entity.News;

public class ModifyNews {
	private DAO dao = new DAO();
	private ResultSet rs;
	private StringBuilder sql;

	public News getById(int id){
		News news=null;
		sql = new StringBuilder();
		sql.append("select * from news where id=");
		sql.append(id);
		try {
			dao.con();
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				news = new News();
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
		sql.append("delete from news where id=");
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
	
	public List<News> getAll(){
		List<News> lsn = new ArrayList<News>();
		sql = new StringBuilder();
		sql.append("select * from news order by addtime desc");
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
				News news = new News();
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

	public List<News> getByLimit(int start,int limitation){
		boolean success=false;
		List<News> lsn = new ArrayList<News>();
		sql = new StringBuilder();
		sql.append("select * from news limit ");
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
				News news = new News();
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
	
	public List<News> getLatestByLimit(int limitation){
		List<News> lsn = new ArrayList<News>();
		sql = new StringBuilder();
		sql.append("select * from news order by addtime desc limit ");
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
				News news = new News();
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
	
	public List<News> getByTitle(String title){
		List<News> lsn = new ArrayList<News>();
		sql = new StringBuilder();
		sql.append("select * from news where title like '%");
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
				News news = new News();
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
	
	public boolean insertNewNews(News news){
		boolean success=false;
		sql = new StringBuilder();
		sql.append("insert into news(title,");
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
	
	public boolean updateById(News news) {
		boolean success=false;
		sql = new StringBuilder();
		sql.append("update news set ");
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
