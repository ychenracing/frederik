package cn.edu.fudan.model.cn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.fudan.entity.cn.CnFamily;
import cn.edu.fudan.model.DAO;

public class CnModifyFamily {
	private DAO dao = new DAO();
	private ResultSet rs;
	private StringBuilder sql;

	/**
	 * get a horse object by id
	 * @param id
	 * @return Horse
	 */
	public CnFamily getById(int id) {
		CnFamily family = null;
		sql = new StringBuilder();
		sql.append("select * from cnfamily where id=");
		sql.append(id);
		try {
			dao.con();
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				family = new CnFamily();
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
		sql.append("delete from cnfamily where id=");
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
	
	public List<CnFamily> getAll() {
		boolean success=false;
		List<CnFamily> lsf = new ArrayList<CnFamily>();
		sql = new StringBuilder();
		sql.append("select * from cnfamily order by addtime desc");
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
				CnFamily family = new CnFamily();
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
	
	public boolean insertNewFamily(CnFamily family) {
		boolean success = false;
		if(getAll()!=null)return false;
		sql = new StringBuilder();
		sql.append("insert into cnfamily(title,");
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

	public boolean updateById(CnFamily family) {
		boolean success = false;
		sql = new StringBuilder();
		sql.append("update cnfamily set ");
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
