# LR - 3C - Ba
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.ba,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.752,
    std_deviation = 0.041)
#df_prog <- add_row(
    #df_prog,
    #analysis = analysis.prog.ba,
    #dataset = dataset.in_vitro,
    #score_function = score_function.f1,
    #n_cell_types = 3,
    #model = model.log_reg,
    #cell_type = cell.mono,
    #average = 0.739,
    #std_deviation = 0.022)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.ba,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.727,
    std_deviation = 0.028)

# NN - 3C - Ba
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.ba,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.753,
    std_deviation = 0.05)
#df_prog <- add_row(
    #df_prog,
    #analysis = analysis.prog.ba,
    #dataset = dataset.in_vitro,
    #score_function = score_function.f1,
    #n_cell_types = 3,
    #model = model.nn,
    #cell_type = cell.mono,
    #average = 0.743,
    #std_deviation = 0.028)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.ba,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.717,
    std_deviation = 0.028)

# LR - 3C - Neu
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.701,
    std_deviation = 0.057)
#df_prog <- add_row(
    #df_prog,
    #analysis = analysis.prog.neu,
    #dataset = dataset.in_vitro,
    #score_function = score_function.f1,
    #n_cell_types = 3,
    #model = model.log_reg,
    #cell_type = cell.mono,
    #average = 0.723,
    #std_deviation = 0.032)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.715,
    std_deviation = 0.031)

# NN - 3C - Neu
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.699,
    std_deviation = 0.075)
#df_prog <- add_row(
    #df_prog,
    #analysis = analysis.prog.neu,
    #dataset = dataset.in_vitro,
    #score_function = score_function.f1,
    #n_cell_types = 3,
    #model = model.nn,
    #cell_type = cell.mono,
    #average = 0.731,
    #std_deviation = 0.051)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.719,
    std_deviation = 0.047)