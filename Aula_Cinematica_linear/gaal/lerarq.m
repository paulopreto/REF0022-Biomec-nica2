function out=lerarq(file)
%out=lerarq('arq') lê o conteúdo do arquivo arq 
%
%        written by Reginaldo J. Santos on 28 May 1999 
%                   DMat/ICEx/UFMG
fid=fopen(file,'rt');
if fid~=-1
 %  out=fscanf(fid,'%c');
  out=[];
  while 1
    line = fgetl(fid);
    if ~isstr(line), break, end
    out=[out line];
    %disp(line)
  end
  fclose(fid);
else
 error(['Arquivo ' file ' não existe!!!']);
end
