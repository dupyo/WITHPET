package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.persistance.mapper.CenterMapper;
import poly.service.ICenterService;

@Service("CenterService")
public class CenterService implements ICenterService {
	
	@Resource(name="CenterMapper")
	private CenterMapper centerMapper;
	
	
	
}
