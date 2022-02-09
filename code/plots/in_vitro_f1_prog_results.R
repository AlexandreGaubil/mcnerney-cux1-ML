# LR - 3C - DC
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.DC,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.692,
    std_deviation = 0.052)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.DC,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.734,
    std_deviation = 0.030)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.DC,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.727,
    std_deviation = 0.029)

# NN - 3C - DC
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.DC,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.711,
    std_deviation = 0.05)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.DC,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.752,
    std_deviation = 0.029)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.DC,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.734,
    std_deviation = 0.029)

# LR - 3C - MoDC
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.modc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.695,
    std_deviation = 0.057)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.modc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.726,
    std_deviation = 0.03)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.modc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.721,
    std_deviation = 0.029)

# NN - 3C - MoDC
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.modc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.694,
    std_deviation = 0.090)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.modc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.727,
    std_deviation = 0.069)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.modc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.714,
    std_deviation = 0.041)

# LR - 3C - MoNeu
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.moneu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.718,
    std_deviation = 0.054)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.moneu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.728,
    std_deviation = 0.031)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.moneu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.720,
    std_deviation = 0.030)

# NN - 3C - MoNeu
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.moneu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.715,
    std_deviation = 0.053)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.moneu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.740,
    std_deviation = 0.031)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.moneu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.728,
    std_deviation = 0.033)

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
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.ba,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.739,
    std_deviation = 0.022)
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
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.ba,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.743,
    std_deviation = 0.028)
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

# LR - 3C - B
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.b,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.729,
    std_deviation = 0.049)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.b,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.743,
    std_deviation = 0.029)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.b,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.729,
    std_deviation = 0.029)

# NN - 3C - B
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.b,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.7,
    std_deviation = 0.074)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.b,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.741,
    std_deviation = 0.065)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.b,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.723,
    std_deviation = 0.046)

# LR - 3C - Pre-B
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.preb,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.716,
    std_deviation = 0.052)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.preb,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.739,
    std_deviation = 0.03)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.preb,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.728,
    std_deviation = 0.029)

# NN - 3C - Pre-b
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.preb,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.726,
    std_deviation = 0.053)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.preb,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.753,
    std_deviation = 0.029)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.preb,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.738,
    std_deviation = 0.029)

# LR - 3C - Neu
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.685,
    std_deviation = 0.054)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.718,
    std_deviation = 0.032)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.708,
    std_deviation = 0.03)

# NN - 3C - Neu
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.682,
    std_deviation = 0.088)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.721,
    std_deviation = 0.062)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.neu,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.709,
    std_deviation = 0.055)

# LR - 3C - HSC
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.hsc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.726,
    std_deviation = 0.046)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.hsc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.741,
    std_deviation = 0.032)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.hsc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.739,
    std_deviation = 0.03)

# NN - 3C - HSC
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.hsc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.735,
    std_deviation = 0.042)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.hsc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.75,
    std_deviation = 0.032)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.hsc,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.744,
    std_deviation = 0.029)

# LR - 3C - MEP
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.mep,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.baso,
    average = 0.715,
    std_deviation = 0.049)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.mep,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.mono,
    average = 0.73,
    std_deviation = 0.031)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.mep,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.log_reg,
    cell_type = cell.neu,
    average = 0.719,
    std_deviation = 0.032)

# NN - 3C - MEP
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.mep,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.baso,
    average = 0.71,
    std_deviation = 0.056)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.mep,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.mono,
    average = 0.735,
    std_deviation = 0.035)
df_prog <- add_row(
    df_prog,
    analysis = analysis.prog.mep,
    dataset = dataset.in_vitro,
    score_function = score_function.f1,
    n_cell_types = 3,
    model = model.nn,
    cell_type = cell.neu,
    average = 0.721,
    std_deviation = 0.037)