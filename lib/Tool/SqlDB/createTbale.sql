

CREATE TABLE tb_notebookList (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  _to TEXT,
  _form TEXT,
  subtitle TEXT,
  createData TEXT,
  updateData TEXT,
  number TEXT,
  other TEXT,
  trans_result TEXT,

);


CREATE TABLE tb_notebookContent (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
    _to TEXT,
    translation_to TEXT,
    _form TEXT,
    translation_form TEXT,
    subtitle TEXT,
    createData TEXT,
    updateData TEXT,
    number TEXT,
    other TEXT,
    trans_result TEXT,
    listid INTEGER
);


CREATE TABLE tb_docList (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
    _to TEXT,
    _form TEXT,
    subtitle TEXT,
    createData TEXT,
    updateData TEXT,
    number TEXT,
    other TEXT,
    trans_result TEXT,

);


CREATE TABLE tb_doccontentList (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
      _to TEXT,
      translation_to TEXT,
      _form TEXT,
      translation_form TEXT,
      subtitle TEXT,
      createData TEXT,
      updateData TEXT,
      number TEXT,
      other TEXT,
      trans_result TEXT,
      listid INTEGER
);
