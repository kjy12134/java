package model.util;

import java.util.List;

public interface Dao {
	
	public List<Object> selectAll(); 
	public Object		selectOne(Object key);
	
	public int			insert(Object obj);
	public int			update(Object obj);
	public int			delete(Object obj);
	
	
}
