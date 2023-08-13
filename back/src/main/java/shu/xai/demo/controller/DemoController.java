package shu.xai.demo.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.csvreader.CsvReader;
import com.univocity.parsers.tsv.TsvParser;
import com.univocity.parsers.tsv.TsvParserSettings;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import shu.xai.demo.service.DemoService;
import shu.xai.sys.enums.ResultCodeEnums;
import shu.xai.sys.utils.JSONUtil;
import shu.xai.sys.utils.ResultUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.*;
import java.util.List;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import java.nio.file.Files;
import org.springframework.core.io.ByteArrayResource;

/**
 * controller层，接收前端请求
 * Created by yuziyi on 2022/1/24.
 */
@RestController
@RequestMapping("/demo")
public class DemoController {

    @Autowired
    private DemoService demoService;

    private final static Logger logger = LoggerFactory.getLogger(DemoController.class);

    @RequestMapping("/downloadFile")
    public ResponseEntity<Resource> downloadFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject params = JSONUtil.getRequestPayload(request);
//        System.out.println(params);
//        String filename = params.getString("fileName");
//        String PDFName = demoService.getPDFName(filename).substring(5);
//        System.out.println(PDFName);
        // 这里假设文件都在 /path/to/files 目录下
        String filePath = "E:\\File\\1_InnovateProj\\Algorithm\\NER\\NER_result\\2008__.txt_test_knowledge_base_with_tag.xlsx";
        File file = new File(filePath);
        if (!file.exists()) {
            // 如果文件不存在，返回 404 错误
            return ResponseEntity.notFound().build();
        }
        // 创建文件输入流
        FileInputStream fis = new FileInputStream(file);
        // 创建字节数组输出流
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = fis.read(buffer)) > -1 ) {
            baos.write(buffer, 0, len);
        }
        baos.flush();

        // 关闭输入流和输出流
        fis.close();
        baos.close();

        byte[] content = baos.toByteArray();
        ByteArrayResource resource = new ByteArrayResource(content);

        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=" + file.getName())
                .contentLength(file.length())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }


    @RequestMapping("/downloadREFile")
    public ResponseEntity<Resource> downloadREFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        JSONObject params = JSONUtil.getRequestPayload(request);
//        System.out.println(params);
//        String filename = params.getString("fileName");
//        String PDFName = demoService.getPDFName(filename).substring(5);
//        System.out.println(PDFName);
        // 这里假设文件都在 /path/to/files 目录下
        String filePath = "E:\\File\\1_InnovateProj\\Algorithm\\RE\\jointInOut.tsv";
        File file = new File(filePath);
        if (!file.exists()) {
            // 如果文件不存在，返回 404 错误
            return ResponseEntity.notFound().build();
        }
        // 创建文件输入流
        FileInputStream fis = new FileInputStream(file);
        // 创建字节数组输出流
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = fis.read(buffer)) > -1 ) {
            baos.write(buffer, 0, len);
        }
        baos.flush();

        // 关闭输入流和输出流
        fis.close();
        baos.close();

        byte[] content = baos.toByteArray();
        ByteArrayResource resource = new ByteArrayResource(content);

        return ResponseEntity.ok()
                .header("Content-Disposition", "attachment; filename=" + file.getName())
                .contentLength(file.length())
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
    /*******************      Upload      ************************/
    /**
     * 查询专利列表并返回
     *
     * @param file        上传文件
     * @param otherParams 其他参数
     * @return result 查询结果封装
     */
    @RequestMapping("/selectFileUpload")
    public String selectFileUpload(HttpServletRequest request, @RequestParam("file") MultipartFile file, @RequestParam("otherParams") String otherParams) {
        String result = "";
        //判断非空
        if (file.isEmpty()) {
            result = ResultUtils.commonResult(ResultCodeEnums.FILE_NULL.getCode(), ResultCodeEnums.FILE_NULL.getMsg(), "");
            return result;
        }
        try {
            System.out.println(file.getOriginalFilename());
            String path = System.getProperty("user.dir") + File.separator + "NASICON_PDF";
            File f = new File(path);
            // 如果不存在该路径就创建
            if (!f.exists()) {
                f.mkdir();
            }
            File dir = new File(path + File.separator + file.getOriginalFilename());
            // 文件写入
            file.transferTo(dir);
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), "");

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    /**
     * 添加专利
     *
     * @param request  http参数
     * @param response http参数
     * @return result 操作结果封装返回
     */
    @RequestMapping("/addNewPatent")
    public String addNewPatent(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String titleE = params.getString("titleE");
            String authorE = params.getString("authorE");
            String l_abstractE = params.getString("l_abstractE");
            String keywordsE = params.getString("keywordsE");
            String publish_date = params.getString("publish_date");
            String reference_type = params.getString("reference_type");
            String research_institute = params.getString("research_institute");
            String volume = params.getString("volume");
            String issue = params.getString("issue");
            String doi = params.getString("doi");
            String start_page = params.getString("start_page");
            String end_page = params.getString("end_page");
            String PDFName = params.getString("PDFName");
            JSONObject paramsResult = demoService.addNewPatent(titleE, authorE, l_abstractE, keywordsE, publish_date, reference_type,
                    research_institute, volume, issue, doi, start_page, end_page, PDFName);
            result = paramsResult.toString();
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }


    /**
     * 查询专利列表并返回
     *
     * @param request  http参数
     * @param response http参数
     * @return result 查询结果封装
     */
    @RequestMapping("/getPatentData")
    public String getPatentData(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONArray paramsResult = demoService.getPatentList();
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }


    @RequestMapping(value = "/MultiPatentInfoSubmit")
    public String MultiPatentInfoSubmit(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        String result = "";
        //判断非空
        if (file.isEmpty()) {
            result = ResultUtils.commonResult(ResultCodeEnums.FILE_NULL.getCode(), ResultCodeEnums.FILE_NULL.getMsg(), "");
            return result;
        }
        try {

            String path = System.getProperty("user.dir") + File.separator + "MultiPatentInfo";
            File f = new File(path);
            // 如果不存在该路径就创建
            if (!f.exists()) {
                f.mkdir();
            }
            File dir = new File(path + File.separator + file.getOriginalFilename());
            // 文件写入
            file.transferTo(dir);
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), "");

            //excel传输完成后应后需要把excel的内容写入到数据库中
            //read读数据
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(System.getProperty("user.dir") + File.separator +
                    "MultiPatentInfo" + File.separator + "[NASICON]MultiPatentInfo.xlsx");  //获取工作簿
            XSSFSheet sheet = xssfWorkbook.getSheetAt(0);             //获取工作表
            int lastRowNum = sheet.getLastRowNum();         //获取行数
            //按一行行来读
            for (int i = 1; i <= lastRowNum; i++) {
                XSSFRow row = sheet.getRow(i);                //创建行对象
                List<String> list = new ArrayList<>();       //创建列表list存放信息
                if (row != null) {                              //行非空则执行遍历
                    for (Cell cell : row) {                     //遍历当前的行对象所有的列，如果行对象的列非空就将数据存到list中
                        if (cell != null) {
                            cell.setCellType(CellType.STRING);
                            String value = cell.getStringCellValue();
                            list.add(value);
                        }
                    }
                }
                System.out.println(list);
                //存入到后端数据库
                JSONObject paramsResult = demoService.addNewPatent(list.get(0), list.get(1), list.get(2),
                        list.get(3), list.get(4), list.get(5), list.get(6), list.get(7), list.get(8),
                        list.get(9), list.get(10), list.get(11) ,list.get(12));
                list = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.FILE_NULL.getCode(), ResultCodeEnums.FILE_NULL.getMsg(), "");
        }
        return result;
    }

    /*******************     PreProcessing      ************************/
    @RequestMapping("/pdfToTxt")
    public String pdfToTxt(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        String result = "";
        String line = "";
        String line1 = "";
        String line2 = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String a = params.getString("article");
            String PDFName = demoService.getPDFName(a).substring(5);
            String article_path = System.getProperty("user.dir") + File.separator + "NASICON_PDF" + File.separator + PDFName + ".pdf";

            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/k", "conda activate Jonas && E:\\Anaconda\\envs\\Jonas\\python.exe E:\\File\\1_InnovateProj\\pre-process\\pdftxt(1).py", article_path);
            pb.redirectErrorStream(true);
            Process p = pb.start();
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));

            while(true)
            {
                File file = new File("E:\\File\\1_InnovateProj\\Algorithm\\NER\\result_literatures\\"+PDFName+".txt");
                if (file.exists()){
                    break;
                }
            }

//                result = line2 + "\n" + line1;
                result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), result);



        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    @RequestMapping("/metaInfo")
    public String metaInfo(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String a = params.getString("article");
            demoService.getDOI(a);
            JSONArray paramsResult = demoService.metainfo(a);
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.METAINFO_ERROR.getCode(), ResultCodeEnums.METAINFO_ERROR.getMsg(), "");
        }
        return result;
    }


    @RequestMapping("/updatePreProcessResult")
    public String updatePreProcessResult(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String sentence_content = params.getString("sentence_content");
            String sentence_id = params.getString("sentence_id");
            JSONObject paramsResult = demoService.updatePreProcessResult(sentence_content, sentence_id);
            result = paramsResult.toString();
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    @RequestMapping("/deleteSentence")
    public String deleteSentence(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String sentence_id = params.getString("sentence_id");
            JSONObject paramsResult = demoService.deletePreProcessResult(sentence_id);
            result = paramsResult.toString();
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    /*******************      NER      ************************/
    @RequestMapping("/getLitName")
    public String getLitName(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String source = params.getString("source");
            Integer isNER = 2;
            if (Objects.equals(source, "RE")) {
                isNER = 0;
            } else if (Objects.equals(source, "NER")) {
                isNER = 1;
            }
            JSONArray paramsResult = demoService.getLitNameList(isNER);
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    public String getLastEntityID() {
        return demoService.getLastEntityID();
    }

    public String getLastSentenceID() {
        return demoService.getLastSentenceID();
    }

    /**
     * Run model.
     */
    @RequestMapping("/entityExtraction")
    public String extractEntity(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        String lastID = getLastEntityID();
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String filename = params.getString("fileName");
            String PDFName = demoService.getPDFName(filename).substring(5);
            PDFName += ".txt";
            System.out.println(filename);
            System.out.println(lastID);
            /*
             * E:\Anaconda & E:\Anaconda\Scripts 添加环境变量才能命令行运行
             * */
            String cmd = "conda activate Jonas&& E:&& cd E:\\File\\1_InnovateProj\\Algorithm\\NER && E:\\Anaconda\\envs\\Jonas\\python.exe E:\\File\\1_InnovateProj\\Algorithm\\NER\\NER.py --inputData=" + PDFName + " --lastID=" + lastID;
            System.out.println(cmd);
//            Process proc = Runtime.getRuntime().exec("C:\\Users\\16690\\Desktop\\test.bat");
            Process proc = Runtime.getRuntime().exec(new String[]{"cmd", "/k", cmd});
            BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            result = in.readLine();
            System.out.println(result);
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), result);
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    // 插入lit_sentence表
    public String insertLitSentence(String topic) {
        String doi = demoService.getDOI(topic);
        String PDFName = demoService.getPDFName(topic).substring(5);
        String file_path = "E:\\File\\1_InnovateProj\\Algorithm\\NER\\NER_result\\" + PDFName + ".txt_all_sentences.csv";
        String result = "";
        try {
            CsvReader reader = new CsvReader(file_path, ',', Charset.forName("UTF-8"));
            ArrayList<String[]> SentenceList = new ArrayList<>();
            while (reader.readRecord()) {
                SentenceList.add(reader.getValues());
            }
            reader.close();
            for (String[] temp_result : SentenceList) {
                JSONObject paramsResult = demoService.insertLitSentence(temp_result[0], doi);
                result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), String.valueOf(paramsResult));
            }
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    /**
     * It should be: READ excel of NER result which is named like "xxx.txt_test_knowledge_base.csv
     * WRITE results from the xlsx to database
     * READ NER statics results from database
     * CLICK 抽取，插入lit_sentence, entity_library
     */
    @RequestMapping("/WriteResults")
    public String WriteReadResults(HttpServletRequest request, HttpServletResponse response) {
        JSONObject params = JSONUtil.getRequestPayload(request);
        String topic = params.getString("topic");
        String PDFName = demoService.getPDFName(topic);
        System.out.println(PDFName.substring(5));
        insertLitSentence(topic);
        String file_path = "E:\\File\\1_InnovateProj\\Algorithm\\NER\\NER_result\\" + PDFName.substring(5) + ".txt_test_knowledge_base_with_tag.xlsx";
        String result = "";
        try {
            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(file_path);
            XSSFSheet sheet = xssfWorkbook.getSheetAt(0);
            int maxRow = sheet.getLastRowNum();

            // WRITE results from the xlsx to database
            ArrayList<String> temp = new ArrayList<>();
            for (int i = 0; i < maxRow; i++) {
                temp.clear();
                for (int column = 0; column < 4; column++) {
                    temp.add(sheet.getRow(i).getCell(column).toString());
                }
                JSONArray DOIandSentence = demoService.getDOIandSentence(temp.get(1));
                System.out.println(DOIandSentence);
                if (DOIandSentence.size() != 0){
                    JSONObject one_DOIandSentence = (JSONObject) DOIandSentence.get(0);

                    String entity_content = temp.get(0);
                    String sentence_content = temp.get(1);
                    String entity_id = temp.get(2);
                    String predicate = temp.get(3);

                    String sentence_id = one_DOIandSentence.getString("sentence_id");
                    String doi = one_DOIandSentence.getString("doi");
                    JSONObject paramsResult = demoService.insertEntityLibrary(entity_id, predicate, doi, sentence_id, entity_content, sentence_content);
                } else {
                    continue;
                }

            }
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }

        return result;
    }

    @PostMapping("/getNERResults")
    public String getNERResult(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String topic = params.getString("topic");
            String doi = demoService.getDOI(topic);
            JSONArray paramsResult = demoService.getNERResult(doi);
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());

        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    @RequestMapping("/getStatics")
    public String getStatics(HttpServletRequest request, HttpServletResponse response) {
        JSONObject params = JSONUtil.getRequestPayload(request);
        String topic = params.getString("topic");
        String doi = demoService.getDOI(topic);
        String result = "";
        JSONArray paramsResult = demoService.getStatics(doi);
        result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());
//
//
//        String file_path = "E:\\File\\1_InnovateProj\\Algorithm\\NER\\NER_result\\" + topic + ".txt_test_knowledge_base_with_tag.xlsx";

//        ArrayList<String> statics_list = new ArrayList<>();
//        try{
//            XSSFWorkbook xssfWorkbook = new XSSFWorkbook(file_path);
//            XSSFSheet sheet = xssfWorkbook.getSheetAt(0);
//            int maxRow = sheet.getLastRowNum();
//
//            // READ NER statics results from database
//            JSONArray arr = new JSONArray();
//            JSONObject element = new JSONObject();
//            for (int i = maxRow - 7; i <= maxRow; i++){
//                statics_list.clear();
//                for (int column = 0; column < 2; column++)
//                {
//                    statics_list.add(sheet.getRow(i).getCell(column).toString());
//                }
//                element.put(statics_list.get(0), statics_list.get(1));
//            }
//            arr.add(element);
//            System.out.println(arr);
//            result= ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(), String.valueOf(arr));
//        } catch (IOException e) {
//            logger.error("error",e);
//            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
//        }
        return result;
    }

    @RequestMapping("/updateNERResult")
    public String updateNERResult(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String entity = params.getString("entity_content");
            String predicate = params.getString("predicate");
            String entity_id = params.getString("entity_id");
            String sentence_id = params.getString("sentence_id");
            JSONObject paramsResult = demoService.updateNERResult(entity, sentence_id, entity_id, predicate);
            result = paramsResult.toString();
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }


    /*******************      RE      ************************/
    public JSONArray prepareCSV(String doi) {
        JSONArray entity_info = demoService.getEntity(doi);
        System.out.println(entity_info.get(0));
        return entity_info;
    }

    @RequestMapping("/checkREInput")
    public String checkREInput(HttpServletRequest request, HttpServletResponse response) {
        JSONObject params = JSONUtil.getRequestPayload(request);
        String topic = params.getString("topic");
        String PDFName = demoService.getPDFName(topic).substring(5);
        String result = "";
        String line = "";
        String line1 = "";
        String line2 = "";
        try {
            String cmd = "conda activate Jonas && E:\\Anaconda\\envs\\Jonas\\python.exe E:\\File\\1_InnovateProj\\Algorithm\\NER_result_process_to_RE_input.py" + " --inputData=" + PDFName;
            System.out.println(cmd);
            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/k", cmd);
            pb.redirectErrorStream(true);
            Process p = pb.start();
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while(true){
                File file = new File("E:\\File\\1_InnovateProj\\Algorithm\\RE\\data_RE\\test\\lyz_test.tsv");
                if (file.exists()){
                    break;
                }
            }
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), result);
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;

    }
    @RequestMapping("/runJoin")
    public String runJoin() {
        String result = "";
        String line = "";
        String line1 = "";
        String line2 = "";
        try {
            String cmd = "conda activate Jonas && E:\\Anaconda\\envs\\Jonas\\python.exe E:\\File\\1_InnovateProj\\Algorithm\\RE\\joinInputOutput.py";
            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/k", cmd);
            pb.redirectErrorStream(true);
            Process p = pb.start();
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while(true){
                File file = new File("E:\\File\\1_InnovateProj\\Algorithm\\RE\\eval\\flag.tsv");
                if (file.exists()){
                    break;
                }
            }
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), result);
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }
    @RequestMapping("/joinInOutToDB")
    public String writeInput() throws IOException {
        TsvParserSettings settings = new TsvParserSettings();
        settings.getFormat().setLineSeparator("\n");
        TsvParser parser = new TsvParser(settings);
        List<String[]> allRows = parser.parseAll(new FileInputStream("E:\\File\\1_InnovateProj\\Algorithm\\RE\\jointInOut.tsv"));
        for (String[] allRow : allRows) {
            String relation = allRow[0].trim();
            String sentence_data = allRow[1].trim();
            String entity_1_id = allRow[2].trim();
            String entity_2_id = allRow[3].trim();
            demoService.insertRelationLibrary(sentence_data, entity_1_id, entity_2_id, relation);
        }
        parser.stopParsing();
        ;
        return "ok";
    }

    @PostMapping("/REResults")
    public String getREResult(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
//            String topic = params.getString("topic");
//            String doi = demoService.getDOI(topic);
            JSONArray paramsResult = demoService.getREResult();
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());

        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    @GetMapping("/REExtraction")
    public String REExtraction() {
        String result = "";
        String line = "";
        String line1 = "";
        String line2 = "";
        try {
            ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/k", "cd E:\\File\\1_InnovateProj\\Algorithm\\RE && conda activate Jonas && E:\\Anaconda\\envs\\Jonas\\python.exe E:\\File\\1_InnovateProj\\Algorithm\\RE\\RE.py");
            pb.redirectErrorStream(true);
            Process p = pb.start();
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while(true){
                File file = new File("E:\\File\\1_InnovateProj\\Algorithm\\RE\\eval\\flag.tsv");
                if (file.exists()){
                    break;
                }
            }
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), result);
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }
    @RequestMapping("/updateREResult")
    public String updateREResult(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONObject params = JSONUtil.getRequestPayload(request);
            String relation = params.getString("relation");
            String sentence = params.getString("sentence");
            JSONObject paramsResult = demoService.updateREResult(relation, sentence);
            result = paramsResult.toString();
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }
    /***********************************************************************************************************************************/


    @RequestMapping("/getTableData")
    public String getTableData(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONArray paramsResult = demoService.getSentencesTableList();
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    @RequestMapping("/getPatentName")
    public String getPatentName(HttpServletRequest request, HttpServletResponse response) {
        String result = "";
        try {
            JSONArray paramsResult = demoService.getPatentNameList();
            result = ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg(), paramsResult.toJSONString());
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }

    @RequestMapping("/runChildTree")
    public String runChildTree (HttpServletRequest request, HttpServletResponse response) throws IOException {
        String result = "";
        try {
            // step1: add node name to mysql superalloy database, data_node table.
            JSONObject params = JSONUtil.getRequestPayload(request);
            String node_name = params.getString("name");
            demoService.addNodeName(node_name);

            // step2: run python.
            String line = "";
            ProcessBuilder pb = new ProcessBuilder("E:\\Anaconda\\envs\\Jonas\\python.exe", "E:\\File\\1_InnovateProj\\py2neo4j-main\\py2neo4j-main\\graphviz_test_db.py");// TODO: whether use _db.
            pb.redirectErrorStream(true);
            Process p = pb.start();
            InputStream is = p.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is));
            while ((line = in.readLine()) != null) {
                System.out.println(line);
            }

            // step3: delete node, for further use.
            JSONObject paramsResult = demoService.deleteNodeName(node_name);
            result = paramsResult.toString();
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }

        return result;
    }

    // top_node必须是
    @RequestMapping("/runMap")
    public String runMap (HttpServletRequest request, HttpServletResponse response) throws IOException {
        String result = "";
        String line1 = "";
        String line2 = "";
        String line = "";
        try {
            // step2: run python.
            ProcessBuilder pb = new ProcessBuilder("E:\\Anaconda\\envs\\Jonas\\python.exe", "E:\\File\\1_InnovateProj\\py2neo4j-main\\py2neo4j-main\\py_to_neo4j_db.py"); // TODO: whether use _db.
            pb.redirectErrorStream(true);
            Process p = pb.start();
            InputStream is = p.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is));
            while ((line = in.readLine()) != null) {
                System.out.println(line);
                line2 = line1;
                line1 = line;
            }
            result = line2 + "\n" + line1;
            System.out.println("result----------------------------------------------");
            System.out.println(result);
        } catch (Exception e) {
            logger.error("error", e);
            result = ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(), ResultCodeEnums.UNKNOWN_ERROR.getMsg(), "");
        }
        return result;
    }
}