package liuyuyang.net.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import liuyuyang.net.mapper.TagMapper;
import liuyuyang.net.model.Tag;
import liuyuyang.net.service.TagService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {
    @Resource
    private TagMapper TagMapper;

    @Override
    public Page<Tag> list(Integer page, Integer size) {
        QueryWrapper<Tag> queryWrapper = new QueryWrapper<>();

        // 分页查询
        Page<Tag> result = new Page<>(page, size);
        TagMapper.selectPage(result, queryWrapper);

        return result;
    }
}