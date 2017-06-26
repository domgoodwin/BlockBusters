<html>
<head>
    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Voting Registration</title>
</head>
<body>
    <div class="sticky-topbar">
        <?php include 'Navbar.php' ?>
    </div>
    <div class="row">
        <div class="large-12 columns">
            <div class="row">
                <div class="large-12 columns">
                    <h1></h1>
                </div>
            </div>
            <div class="row">
                <div class="large-4 large-push-4 columns">
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="large-12 columns">
            <div class="row">
                <div class="large-12 columns">
                    <h1>Voting Booth</h1>
                </div>
            </div>
            <div class="row">
                <div class="large-4 large-push-4 columns">
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="large-12 columns" id="#TheTabs">
            <div class="row collapse">
                <div class="large-4 columns">
                    <ul class="tabs vertical tabHeight" data-tabs id="example-vert-tabs" role="tablist" data-deep-link="true">
                        <li class="tabs-title"><a href="#PrevVotes">Previous Votes</a></li>
                        <li class="tabs-title"><a href="#Vote">Issue Vote</a></li>
                        <li class="tabs-title"><a href="#UpcomingVotes">Upcoming Votes</a></li>
                    </ul>
                </div>
                <div class="large-8 columns">
                    <div class="tabs-content vertical" data-tabs-content="example-vert-tabs">
                        <div class="tabs-panel is-active tabHeight" id="PrevVotes">
                            <div class="row">
                                <div class="large-12 columns">
                                    <div class="callout">
                                        <div class="row">
                                            <div class="large-6 columns">
                                                <h3>Previous Votes</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <form method="post" action"/VotingBooth.php">
                                                <div class="large-12 columns">
                                                    <div class="large-4 columns">
                                                        <div class="row">
                                                            <div class="large-12 columns">
                                                                <label>Year:</label><input class="input" type="text" name="vote-year"> <span class="error" required></span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="large-12 columns">
                                                                <label>Type:</label><input class="input" type="password" name="vote-type"> <span class="error"></span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="large-6 large-push-6 columns">
                                                                <input class="success button fullWidth" type="submit" name="search" id="search" value="Search">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="large-6 columns">
                                                    <div class="row">
                                                        <?php
                                                        if (isset($_POST['search'])) {
                                                            $Year  = $_POST['vote-year'];
                                                            $Type = $_POST['vote-type'];
                                                            $result = GetVotes($Year, $Type);
                                                        }
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tabs-panel is-active tabHeight" id="Vote">
                            <div class="row">
                                <div class="large-12 columns">
                                    <div class="callout">
                                        <div class="row">
                                            <div class="large-6 columns">
                                                <h3>Issue Vote</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <form method="post" action"/VotingBooth.php">
                                                <div class="large-12 columns">
                                                    <div class="large-12 columns">
                                                        <div class="row">
                                                            <div class="large-12 columns">
                                                                <label>Vote:</label><input class="input" type="text" name="vote"> <span class="error" required></span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="large-12 columns">
                                                                <label>Your selection:</label><input class="input" type="password" name="vote-selection"> <span class="error"></span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="large-3 large-push-9 columns">
                                                                <input class="success button fullWidth" type="submit" name="confirm" id="confirm" value="Confirm vote">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tabs-panel is-active tabHeight" id="UpcomingVotes">
                            <div class="row">
                                <div class="large-12 columns">
                                    <div class="callout">
                                        <div class="row">
                                            <div class="large-6 columns">
                                                <h3>Upcoming Votes</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/vendor/jquery.js"></script>
<script src="js/vendor/what-input.js"></script>
<script src="js/vendor/foundation.js"></script>
<script src="js/app.js"></script>
</body>
</html>
