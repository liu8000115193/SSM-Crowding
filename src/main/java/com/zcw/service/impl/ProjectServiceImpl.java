package com.zcw.service.impl;

import com.zcw.dao.*;
import com.zcw.model.*;
import com.zcw.service.ProjectService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProjectServiceImpl implements ProjectService {
    private static org.slf4j.Logger logger= LoggerFactory.getLogger(ProjectServiceImpl.class);
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private KindMapper kindMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private AddressMapper addressMapper;
    @Override
    //查找热门项目
    public Map<String,Object> findHostProject() {
        logger.info("find host project!");
        ResultVO resultVO=new ResultVO();
        List<Project> AllProject = new ArrayList<>();
        List<Project> hostProject = new ArrayList<>();
        List<Project> freeProject = new ArrayList<>();
//        List<String> images = new ArrayList<>();
        Map<String,Object> result = new HashMap<>();
        try{
            AllProject = projectMapper.findAllProject();
            for(Project project:AllProject){
                project.setProcess(project.getSupmoney(),project.getNeedmoney());
                project.setDateTime(project.getDeadline());
            }
            hostProject=AllProject.stream().filter(project -> project.getTypeid()==1).sorted(Comparator.comparingDouble(Project::getSupmoney).reversed()).collect(Collectors.toList());
            if (hostProject.size()>5)
                hostProject = hostProject.subList(0,5);
            freeProject = (List<Project>) AllProject.stream().filter(project->project.getTypeid()==2).sorted(Comparator.comparingDouble(Project::getSupmoney).reversed()).collect(Collectors.toList());
            if (freeProject.size()>4)
                freeProject=freeProject.subList(0,4);
//            images = (List<String>) AllProject.stream().filter(project -> project.getTypeid()==1).map(Project::getImage).collect(Collectors.toList());
            result.put("host",hostProject);
            result.put("free",freeProject);
            result.put("image",AllProject);
            resultVO.setData(result);
            resultVO.setCode(0);
            logger.info("find project success");
        }catch (Exception e){
            logger.info(e+"find fail");
        }
        return result;
    }

//    @Override
//    public Project findById() {
//        logger.info("find host project!");
//        return projectMapper.findById();
//    }

    @Override
    public Map<String, Object> detailProject(Integer id) {
        logger.info("find  project detail!");
        Map<String,Object> map=new HashMap<>();
        try {
            Project project=projectMapper.findProjectDeatilById(id);
            project.setProcess(project.getSupmoney(),project.getNeedmoney());
            map.put("project",project);
            Users users = usersMapper.findUserById(project.getUserid());
            map.put("user",users);
            List<Comment> commentList=commentMapper.findCommentByProjectId(id);
            map.put("comment",commentList);
            logger.info("find comment success!");
        }catch (Exception e){
            logger.info(e+"find comment failed!");
        }
        return map;
    }

    @Override
    public List<Project> findProjectByKeyword(String keyword) {
        logger.info("find host project!");
        List<Project> projectList=new ArrayList<>();
        try{
            projectList=projectMapper.findProjectByKeyword(keyword);
            logger.info("search project success");
        }catch (Exception e){
            logger.info(e+"search success fail");
        }
        return projectList;
    }

    @Override
    public List<Project> findProjectByuserid(Integer id) {
        logger.info("find project by user id!");
        List<Project> projectList=new ArrayList<>();
        projectList=projectMapper.findProjectByUserid(id);
        if (projectList.size()==0)
            logger.info("find project by user id fail");
        logger.info("find project by user id success");
        return projectList;
    }

    @Override
    public ResultVO addProject(Project project) {
        logger.info("add project!");
        try {
            projectMapper.addProject(project);
        }catch (Exception e){
            logger.info("添加项目失败");
            return ResultVO.error(e+"添加项目失败");
        }
        return ResultVO.success();
    }

    @Override
    public List<Kind> displayKind() {
        logger.info("display project kind!");
        return kindMapper.findKind();
    }

    @Override
    public List<Type> displayType() {
        logger.info("display project type!!");
        return typeMapper.findType();
    }

    @Override
    public ResultVO sortProject(String sort, String state, Integer toPage, String keyword) {
        logger.info("sort project!");
        ResultVO resultVO = new ResultVO();
        List<Project> list= new ArrayList<>();
        Map<String,Object> result=new HashMap<>();
        int total=0;
        if (toPage==null)
            toPage=1;
        try{
            list=projectMapper.sortProject(sort,state,toPage,keyword);
            total=projectMapper.getAllProject();
            result.put("project",list);
            result.put("total",total);
            resultVO=resultVO.success(result,"查询成功");
        }catch (Exception e){
            resultVO=resultVO.error(e+"查询失败");
        }
        return resultVO;
    }

    @Override
    public Object userOrder(Integer pid, Integer uid) {
        logger.info("add user order!");
        Map<String,Object> map=new HashMap<>();
        try {
            Project project=projectMapper.findProjectDeatilById(pid);
            map.put("project",project);
            Users users = usersMapper.findUserById(project.getUserid());
            map.put("user",users);
            List<Address> addressList=addressMapper.findAddressByUserid(uid);
            map.put("address",addressList);
            logger.info("find address success!");
        }catch (Exception e){
            logger.info(e+"find address failed!");
        }
        return map;
    }
//收藏项目
    @Override
    public void addCollects(Integer projectId,Integer userId) {

    }

    @Override
    public List<Project> findProjectByAdmin() {
        return projectMapper.findProjectByAdmin();
    }

    @Override
    public void shenHeProject(Integer id, String shenHe) {
        projectMapper.shenHeProject(id,shenHe);
    }
//删除禁用
    @Override
    public void deleteproj(Integer id) {
        projectMapper.deleteProject(id);
    }
}
