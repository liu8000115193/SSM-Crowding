package com.zcw.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zcw.model.Project;
import com.zcw.model.ResultVO;
import com.zcw.service.impl.ProjectServiceImpl;
import com.zcw.util.CheckUtil;
import com.zcw.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class ProjectController {
    @Autowired
    private ProjectServiceImpl projectService;
    //主页显示
    @RequestMapping("/hostProject")
//    @ResponseBody
    public String findHostProject(Model model){
        Map<String,Object> map = new HashMap<>();
        map = projectService.findHostProject();
        model.addAttribute("map",map);
        return "index";
    }
    /**
      * @Description:     项目详情
      * @Author:         刘方红
      * @Date:     2019/5/9 17:56
      * @param:      * @param null
      * @return
     */
    @RequestMapping("/detailProject")
    public String detailProject(@RequestParam(value = "id") Integer id,Model model){
//        projectService.detailProject(id);
        model.addAttribute("map",projectService.detailProject(id));
        return "/user/project-detail";
    }
    //搜索
    @RequestMapping("/searchProject")
    public String searchProject(@RequestParam(value = "keyword") String keyword){
       projectService.findProjectByKeyword(keyword);
        return "/user/project-detail";
    }
    //我的项目
    @RequestMapping("/userProject/{id}")
    public String getUserProject(@PathVariable(value = "id") Integer id,
                                 @RequestParam(required = false, defaultValue = "1") int pageNo,
                                 @RequestParam(required = false, defaultValue = "5") int pageSize,
                                 Model model){
        PageHelper.startPage(pageNo, pageSize);
        List<Project> list = projectService.findProjectByuserid(id);
        List<Project> list1= list.stream().filter(project->project.getStatue().equals("众筹中")).collect(Collectors.toList());
        List<Project> list2= list.stream().filter(project->project.getStatue().equals("众筹成功")).collect(Collectors.toList());
        List<Project> list3= list.stream().filter(project->project.getStatue().equals("众筹失败")).collect(Collectors.toList());
        PageInfo<Project> pageInfo = new PageInfo<Project>(list);
        PageInfo<Project> pageInfo1 = new PageInfo<Project>(list1);
        PageInfo<Project> pageInfo2 = new PageInfo<Project>(list2);
        PageInfo<Project> pageInfo3 = new PageInfo<Project>(list3);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("listProject", list);
        model.addAttribute("pageInfo1", pageInfo1);
        model.addAttribute("pageInfo2", pageInfo2);
        model.addAttribute("pageInfo3", pageInfo3);
        return "user/user-project";
    }
    //添加项目
    @RequestMapping("/project/addProject")
    @ResponseBody
    public ResultVO addProject(@RequestParam("file1") MultipartFile imagelist,
                               @RequestParam("file2") MultipartFile image,
                               @RequestParam("file3") MultipartFile backimage,
                               Project project,HttpServletRequest request){
        ResultVO resultVO = CheckUtil.checkProject(project);
        if (resultVO.getCode()==0) {
            String rootPath = request.getSession().getServletContext().getRealPath("images/");
            String fileUrl = null;
            try {
                fileUrl = FileUpload.imageUpload(imagelist,rootPath);
                project.setImagelist(fileUrl);
                project.setImage(FileUpload.imageUpload(image,rootPath));
                project.setBackimage(FileUpload.imageUpload(backimage,rootPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
            resultVO = projectService.addProject(project);
        }
        return resultVO;
    }
    //浏览项目
    @RequestMapping("/project/sortByInforProject")
    @ResponseBody
    public ResultVO sortProject(String sort,String state,Integer toPage,String keyword){
        return projectService.sortProject(sort,state,toPage,keyword);
    }
    @RequestMapping(value = "/project/OrderProject")
    public String orderProject(@RequestParam(value = "pid") Integer pid,
                               @RequestParam(value = "uid") Integer uid, Model model){
        model.addAttribute("map",projectService.userOrder(pid,uid));
        return "/user/user-order";
    }

}
