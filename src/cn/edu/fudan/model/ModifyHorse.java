package cn.edu.fudan.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.fudan.entity.Horse;

public class ModifyHorse {
	private DAO dao = new DAO();
	private ResultSet rs;
	private StringBuilder sql;

	/**
	 * get a horse object by id
	 * @param id
	 * @return Horse
	 */
	public Horse getById(int id) {
		Horse horse = null;
		sql = new StringBuilder();
		sql.append("select * from horse where id=");
		sql.append(id);
		try {
			dao.con();
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				horse = new Horse();
				horse.setId(Integer.valueOf(rs.getString(1)));
				horse.setTitle(rs.getString(2));
				horse.setBrief(rs.getString(3));
				horse.setIntro(rs.getString(4));
				horse.setProperty(rs.getString(5));
				horse.setCover(rs.getString(6));
				horse.setGallery(rs.getString(7));
				horse.setVideo(rs.getString(8));
				horse.setSportoryoung(Integer.valueOf(rs.getString(9)));
				horse.setAddtime(rs.getString(10));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} finally {
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
		return horse;
	}

	
	public Map<Integer, Horse> getPreNext(int id) {
		Map<Integer, Horse> horseMap = new HashMap<Integer, Horse>();
		Horse horse = null;
		sql = new StringBuilder();
		sql.append("select * from horse where ");
		sql.append("id<");
		sql.append(id);
		sql.append(" order by id desc");
		sql.append(" limit 1");
		try {
			dao.con();
			rs = null;
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				horse = new Horse();
				horse.setId(Integer.valueOf(rs.getString(1)));
				horse.setTitle(rs.getString(2));
				horse.setBrief(rs.getString(3));
				horse.setIntro(rs.getString(4));
				horse.setProperty(rs.getString(5));
				horse.setCover(rs.getString(6));
				horse.setGallery(rs.getString(7));
				horse.setVideo(rs.getString(8));
				horse.setSportoryoung(Integer.valueOf(rs.getString(9)));
				horse.setAddtime(rs.getString(10));
			}
			horseMap.put(2, horse);
			sql = new StringBuilder();
			sql.append("select * from gallery where ");
			sql.append("id>");
			sql.append(id);
			sql.append(" order by id asc");
			sql.append(" limit 1");
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				horse = new Horse();
				horse.setId(Integer.valueOf(rs.getString(1)));
				horse.setTitle(rs.getString(2));
				horse.setBrief(rs.getString(3));
				horse.setIntro(rs.getString(4));
				horse.setProperty(rs.getString(5));
				horse.setCover(rs.getString(6));
				horse.setGallery(rs.getString(7));
				horse.setVideo(rs.getString(8));
				horse.setSportoryoung(Integer.valueOf(rs.getString(9)));
				horse.setAddtime(rs.getString(10));
			}
			horseMap.put(1, horse);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} finally {
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
		return horseMap;
	}

	public boolean deleteById(int id) {
		boolean success = false;
		sql = new StringBuilder();
		sql.append("delete from horse where id=");
		sql.append(id);
		try {
			dao.con();
			if (dao.stmt.executeUpdate(sql.toString()) != 0)
				success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} finally {
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

	public List<Horse> getAll() {
		List<Horse> lsh = new ArrayList<Horse>();
		sql = new StringBuilder();
		sql.append("select * from horse order by addtime desc");
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
				Horse horse = new Horse();
				horse.setId(Integer.valueOf(rs.getString(1)));
				horse.setTitle(rs.getString(2));
				horse.setBrief(rs.getString(3));
				horse.setIntro(rs.getString(4));
				horse.setProperty(rs.getString(5));
				horse.setCover(rs.getString(6));
				horse.setGallery(rs.getString(7));
				horse.setVideo(rs.getString(8));
				horse.setSportoryoung(Integer.valueOf(rs.getString(9)));
				horse.setAddtime(rs.getString(10));
				lsh.add(horse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return lsh;
	}
	
	public List<Horse> getByCategory(int sportoryoung) {
		List<Horse> lsh = new ArrayList<Horse>();
		sql = new StringBuilder();
		sql.append("select * from horse where sportoryoung=");
		sql.append(sportoryoung);
		sql.append(" order by addtime desc ");
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
				Horse horse = new Horse();
				horse.setId(Integer.valueOf(rs.getString(1)));
				horse.setTitle(rs.getString(2));
				horse.setBrief(rs.getString(3));
				horse.setIntro(rs.getString(4));
				horse.setProperty(rs.getString(5));
				horse.setCover(rs.getString(6));
				horse.setGallery(rs.getString(7));
				horse.setVideo(rs.getString(8));
				horse.setSportoryoung(Integer.valueOf(rs.getString(9)));
				horse.setAddtime(rs.getString(10));
				lsh.add(horse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return lsh;
	}

	public List<Horse> getByTitle(String title) {
		List<Horse> lsh = new ArrayList<Horse>();
		sql = new StringBuilder();
		sql.append("select * from horse where title like '%");
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
				Horse horse = new Horse();
				horse.setId(Integer.valueOf(rs.getString(1)));
				horse.setTitle(rs.getString(2));
				horse.setBrief(rs.getString(3));
				horse.setIntro(rs.getString(4));
				horse.setProperty(rs.getString(5));
				horse.setCover(rs.getString(6));
				horse.setGallery(rs.getString(7));
				horse.setVideo(rs.getString(8));
				horse.setSportoryoung(Integer.valueOf(rs.getString(9)));
				horse.setAddtime(rs.getString(10));
				lsh.add(horse);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return lsh;
	}

	public boolean insertNewHorse(Horse horse) {
		boolean success = false;
		sql = new StringBuilder();
		
		sql.append("insert into horse(title,");
		if(horse.getBrief()!=null){
			sql.append("brief,");
		}
		sql.append("intro,property,");
		if(horse.getCover()!=null){
			sql.append("cover,");
		}
		sql.append("gallery,");
		if(horse.getVideo()!=null){
			sql.append("video,");
		}
		if(horse.getSportoryoung()!=0){
			sql.append("sportoryoung,");
		}
		sql.append("addtime) values('");
		sql.append(horse.getTitle());
		sql.append("','");
		if(horse.getBrief()!=null){
			sql.append(horse.getBrief());
			sql.append("','");
		}
		sql.append(horse.getIntro());
		sql.append("','");
		sql.append(horse.getProperty());
		sql.append("','");
		if(horse.getCover()!=null){
			sql.append(horse.getCover());
			sql.append("','");
		}
		sql.append(horse.getGallery());
		sql.append("','");
		if(horse.getVideo()!=null){
			sql.append(horse.getVideo());
			sql.append("','");
		}
		if(horse.getSportoryoung()!=0){
			sql.deleteCharAt(sql.length()-1);
			sql.append(horse.getSportoryoung());
			sql.append(",'");
		}
		sql.append(horse.getAddtime());
		sql.append("')");
		try {
			dao.con();
			if (dao.stmt.executeUpdate(sql.toString()) != 0)
				success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

	public boolean updateById(Horse horse) {
		boolean success = false;
		sql = new StringBuilder();
		sql.append("update horse set ");
		if (horse.getTitle() != null) {
			sql.append("title='");
			sql.append(horse.getTitle());
			sql.append("',");
		}
		if (horse.getBrief() != null) {
			sql.append("brief='");
			sql.append(horse.getBrief());
			sql.append("',");
		}
		if (horse.getIntro() != null) {
			sql.append("intro='");
			sql.append(horse.getIntro());
			sql.append("',");
		}
		if (horse.getProperty() != null) {
			sql.append("property='");
			sql.append(horse.getProperty());
			sql.append("',");
		}
		if (horse.getCover() != null) {
			sql.append("cover='");
			sql.append(horse.getCover());
			sql.append("',");
		}
		if (horse.getGallery() != null) {
			sql.append("gallery='");
			sql.append(horse.getGallery());
			sql.append("',");
		}
		if (horse.getVideo() != null) {
			sql.append("video='");
			sql.append(horse.getVideo());
			sql.append("',");
		}
		if(horse.getSportoryoung()!=0){
			sql.append("sportoryoung=");
			sql.append(horse.getSportoryoung());
			sql.append(",");
		}
		if (horse.getAddtime() != null) {
			sql.append("addtime='");
			sql.append(horse.getAddtime());
			sql.append("',");
		}
		sql.setLength(sql.length() - 1);
		sql.append(" where id=");
		sql.append(horse.getId());
		try {
			dao.con();
			//System.out.println(sql.toString());
			if (dao.stmt.executeUpdate(sql.toString()) != 0)
				success = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} finally {
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
