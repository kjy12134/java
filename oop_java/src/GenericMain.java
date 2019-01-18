import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import model.vo.DeptVO;

public class GenericMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<DeptVO> list = make();
		Iterator<DeptVO> ite = list.iterator();
		
		while(ite.hasNext()) {
			System.out.println(ite.next());
		}
		
		makeSet();
	}

	public static ArrayList<DeptVO> make() {
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		list.add(new DeptVO());
		list.add(new DeptVO());

		return list;
	}
	
	public static void makeSet() { 
		Set<String> set = new HashSet<>(); // set상속
		set.add("abc");
		set.add("abcd");
		set.add("abced");
		set.add("abfcd");
		// 순서 없음
		System.out.println(set);
		Iterator<String> ite = set.iterator();
		
		while(ite.hasNext()) {
			System.out.println(ite.next());
		}
	}
	
	public static void makeMap() {
		Map<String, String> map = new HashMap<>();
		map.put("1", "jslim");
		map.put("2", "abc");
		map.put("3", "def");

		// map으로 loop 돌리는 방법...
		Set<String> keys = map.keySet(); // map의 key만 Set타입으로 return
		Iterator<String> ite = keys.iterator();
		
		while(ite.hasNext()) { 
			System.out.println(map.get(ite.next()));
		}
	}
}
