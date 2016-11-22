<?php
exec('git -C mod/socialwiki pull 2>&1', $out);
echo implode('<br>', $out);
?>