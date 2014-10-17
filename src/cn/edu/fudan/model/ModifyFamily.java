package cn.edu.fudan.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.edu.fudan.entity.Family;
import cn.edu.fudan.entity.Horse;

public class ModifyFamily {
	private DAO dao = new DAO();
	private ResultSet rs;
	private StringBuilder sql;

	/**
	 * get a horse object by id
	 * @param id
	 * @return Horse
	 */
	public Family getById(int id) {
		Family family = null;
		sql = new StringBuilder();
		sql.append("select * from family where id=");
		sql.append(id);
		try {
			dao.con();
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				family = new Family();
				family.setId(Integer.valueOf(rs.getString(1)));
				family.setTitle(rs.getString(2));
				family.setIntro(rs.getString(3));
				family.setGallery(rs.getString(4));
				family.setVideo(rs.getString(5));
				family.setAddtime(rs.getString(6));
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
		return family;
	}

	public boolean deleteById(int id) {
		boolean success = false;
		sql = new StringBuilder();
		sql.append("delete from family where id=");
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
	
	public List<Family> getAll() {
		boolean success=false;
		List<Family> lsf = new ArrayList<Family>();
		sql = new StringBuilder();
		sql.append("select * from family order by addtime desc");
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
				Family family = new Family();
				family.setId(Integer.valueOf(rs.getString(1)));
				family.setTitle(rs.getString(2));
				family.setIntro(rs.getString(3));
				family.setGallery(rs.getString(4));
				family.setVideo(rs.getString(5));
				family.setAddtime(rs.getString(6));
				lsf.add(family);
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
		if(success)
		    return lsf;
		else return null;
	}
	
	public boolean insertNewFamily(Family family) {
		boolean success = false;
		if(getAll()!=null)return false;
		sql = new StringBuilder();
		sql.append("insert into family(title,");
		sql.append("intro,gallery,");
		if(family.getVideo()!=null){
			sql.append("video,");
		}
		sql.append("addtime) values('");
		sql.append(family.getTitle());
		sql.append("','");
		sql.append(family.getIntro());
		sql.append("','");
		sql.append(family.getGallery());
		sql.append("','");
		if(family.getVideo()!=null){
			sql.append(family.getVideo());
			sql.append("','");
		}
		sql.append(family.getAddtime());
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

	public boolean updateById(Family family) {
		boolean success = false;
		sql = new StringBuilder();
		sql.append("update family set ");
		if (family.getTitle() != null) {
			sql.append("title='");
			sql.append(family.getTitle());
			sql.append("',");
		}
		if (family.getIntro() != null) {
			sql.append("intro='");
			sql.append(family.getIntro());
			sql.append("',");
		}
		if (family.getGallery() != null) {
			sql.append("gallery='");
			sql.append(family.getGallery());
			sql.append("',");
		}
		if (family.getVideo() != null) {
			sql.append("video='");
			sql.append(family.getVideo());
			sql.append("',");
		}
		if (family.getAddtime() != null) {
			sql.append("addtime='");
			sql.append(family.getAddtime());
			sql.append("',");
		}
		sql.setLength(sql.length() - 1);
		sql.append(" where id=");
		sql.append(family.getId());
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
