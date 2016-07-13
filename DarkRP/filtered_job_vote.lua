-- This serverside script allows you to use a new job field canVoteFor.
-- It should return true (can vote), false (cannot vote) or nil (default).
-- Example:
-- canVoteFor = function( ply, voter ) return voter:Team() == TEAM_MAYOR end,
-- Save this file as garrysmod/lua/autorun/server/filtered_job_vote.lua

hook.Add( "canVote", "filtered_job_vote", function( voter, vote )
	if RPExtraTeams and vote.info and vote.info.targetTeam and vote.target and vote.votetype == "job" then
		local job = RPExtraTeams[vote.info.targetTeam]
		if job and job.canVoteFor then
			local can = job.canVoteFor( vote.target, voter )
			if can == nil then
				return
			elseif can then
				return true
			else
				return false, ""
			end
		end
	end
end )
